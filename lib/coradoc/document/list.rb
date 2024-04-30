module Coradoc
  module Document
    class List
      attr_reader :items, :prefix, :id, :ol_count, :anchor

      def initialize(items, options = {})
        @items = items
        @items = [@items] unless @items.is_a?(Array)
        @id = options.fetch(:id, nil)
        @anchor = @id.nil? ? nil : Inline::Anchor.new(@id)
        @ol_count = options.fetch(:ol_count, 1)
        @attrs = options.fetch(:attrs, AttributeList.new)
      end

      def to_adoc
        content = "\n"
        @items.each do |item|
          c = Coradoc::Generator.gen_adoc(item)
          if !c.empty?
            content << "#{prefix}"
            content << " " if c[0]!=" "
            content << c
          end
        end
        anchor = @anchor.nil? ? "" : "#{@anchor.to_adoc}"
        attrs = @attrs.to_adoc(false)
        "\n#{anchor}#{attrs}" + content
      end

      class Item
        attr_reader :id
        def initialize(content, options = {})
          @content = content
          @id = options.fetch(:id, nil)
          @anchor = @id.nil? ? nil : Inline::Anchor.new(@id)
        end
        def to_adoc
          anchor = @anchor.nil? ? "" : "#{@anchor.to_adoc}"
          if @content.is_a?(Array)
            content = @content.map{|subitem| Coradoc::Generator.gen_adoc(subitem)}.join("\n+\n")
          else
            content = Coradoc::Generator.gen_adoc(@content).chomp
          end
          " #{anchor}#{content.chomp}\n"
        end
      end
    end
  end
end
