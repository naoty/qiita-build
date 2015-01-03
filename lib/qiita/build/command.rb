require "json"
require "optparse"
require "qiita"

module Qiita
  module Build
    class Command
      def initialize(stdin, argv)
        @options = {}
        @json = JSON.parse(stdin)
        @argv = parse_options!(argv)
      end

      def run
        client = Qiita::Client.new(team: team, access_token: access_token)
        response = client.get_template(template_id)
        template = response.body["body"]
        Builder.new.build(template: template, json: @json)
      end

      private

      def parse_options!(options)
        option_parser.on("-a VAL", "--access-token=VAL") { |v| @options[:access_token] = v }
        option_parser.on("-t VAL", "--team=VAL") { |v| @options[:team] = v }
        argv = option_parser.parse!(options)
        argv.delete(access_token)
        argv.delete(team)
        argv
      end

      def option_parser
        @option_parser ||= OptionParser.new
      end

      def access_token
        @options[:access_token]
      end

      def team
        @options[:team]
      end

      def template_id
        @template_id ||= @argv.pop
      end
    end
  end
end