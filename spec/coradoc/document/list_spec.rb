require "spec_helper"

RSpec.describe Coradoc::Document::List do
  describe ".initialize" do
    it "initializes and exposes list" do
      items = ["Item 1", "Item 2", "Item 3"]

      list = Coradoc::Document::List::Unordered.new(items)

      expect(list.items).to eq(items)
    end
    it "handles list continuations" do
      items2 = Coradoc::Document::List::Item.new(["Item 2a", "Item 2b", "Item 2c"])
      item1 = Coradoc::Document::List::Item.new("Item 1")
      items = [item1, items2]

      list = Coradoc::Document::List::Unordered.new(items)

      expect(list.to_adoc).to eq("\n\n* Item 1\n* Item 2a\n+\nItem 2b\n+\nItem 2c\n")
    end
  end
end
