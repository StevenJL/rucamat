module Rucamat
  class Collection
    attr_reader :collection, :to_add

    def initialize(collection)
      @collection = collection
    end

    def merge(collection_ext)
      collection_ext.collection.each do |obj_ext|
        if include_and_merged(obj_ext)
          next
        else
          self.to_add << unless include?(obj_ext)
        end
      end
    end

    def include?(obj_ext)
      self.collection.each do |obj_int|
        if obj_ext.name == obj_int.name
          obj_int.merge(obj_ext)
          return true
        end
      end
      false
    end
  end
end
