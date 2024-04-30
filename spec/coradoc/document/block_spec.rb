require "spec_helper"

RSpec.describe Coradoc::Document::Block do
  describe ".initialize" do
    it "initializes and exposes attributes" do
      type = "quote"
      title = "This is a block title"

      block = Coradoc::Document::Block.new(title, type: type)

      expect(block.title).to eq(title)
      expect(block.type).to eq(:quote)
      expect(block.lines).to be_empty
      expect(block.attributes.empty?).to eq(true)
    end
  end

  describe "#type" do
    it "translates delimiter to proper types" do
      title = "Block title"
      delimiter = "____"

      block = Coradoc::Document::Block.new(title, delimiter: delimiter)

      expect(block.title).to eq(title)
      expect(block.type).to eq(:quote)
    end
  end
end
