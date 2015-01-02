module Qiita
  module Build
    class Builder
      def initialize
      end

      def build(template: "", json: {})
        json.each do |key, value|
          template.gsub!(%r{%\{#{key.to_s}\}}) { value }
        end
        template
      end
    end
  end
end