module AuxiliaryAddons
  module RubyAddons
    # ::Rails.logger.error("...")

    # Check present of object
    def is_object_here?(obj)
      return false if obj.nil?
      return true
    end

    # Check present not empty of string
    def is_string_here?(str)
      return false if str.nil?
      return false if str.blank?
      return true
    end

    # TODO: make paramters as hash articles
    # Check present not empty of string
    def is_array_items_here?(array1, array2, array3)
      return true if array1.size() > 0
      return true if array2.size() > 0
      return true if array3.size() > 0
      return false
    end

    # Convert params to arrary of ids
    def cast_ids_to_i(params)
      ids = []
      ids << params["id"].to_i if !params["id"].nil?
      if !params["ids"].nil?
        params["ids"].each do |id|
          next if id.to_i == 0 # Special case: all selected
          ids << id.to_i
        end
      end
      ids
    end


  end
end