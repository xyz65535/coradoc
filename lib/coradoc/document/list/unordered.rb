module Coradoc
  module Document
    class List
      class Unordered < List
        def initialize(items, options = {})
          super(items, options)
        end

        def prefix
          "*" * [@ol_count, 1].max
        end
      end
    end
  end
end
