require "spec_helper"

RSpec.describe Qiita::Build::Builder do
  let(:fixture_path) do
    path = File.expand_path("../../fixtures", __dir__)
    Pathname.new(path)
  end

  let(:builder) do
    described_class.new
  end

  describe "#build" do
    let(:template) do
      fixture_path.join("template.md").read
    end

    let(:item) do
      fixture_path.join("item.md").read
    end

    let(:json) do
      {
        fullname: "Naoto Kaneko",
        nickname: "naoty",
        location: "Tokyo",
        birthday: "1987/6/2"
      }
    end

    subject do
      builder.build(template: template, json: json)
    end

    it { is_expected.to eq item }
  end
end