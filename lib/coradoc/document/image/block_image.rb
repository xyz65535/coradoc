module Coradoc
  module Document
    class Image
      class BlockImage < Image
        VALIDATORS_NAMED_BLOCK = {
          caption: String,
          align: [:one, "left", "center", "right"],
          float: [:one, "left", "right"]
        }

        def initialize(title, id, src, options = ())
          super(title, id, src, options)
          @colons = "::"
        end

        def validate_named
          @attributes.validate_named(VALIDATORS_NAMED, VALIDATORS_NAMED_BLOCK)
        end
      end
    end
  end
end
