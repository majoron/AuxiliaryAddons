module AuxiliaryAddons
  module HtmlHelper
    # ::Rails.logger.error("...")
  
    #
    # Common HTML helpers
    #
  
    #
    def hash_to_string(params = {})
      result = ""
      params.each do |key, value|
        blank = result.blank?
        result += (key.to_s + "=" + value.to_s) if blank
        result += ("&amp;" + key.to_s + "=" + value.to_s) if !blank
      end
  
      # TODO: replace whitespaced and etc
      result
    end
  
    #
    def newlines_to_htmlbrs(str)
      return str if (str.nil? || str.blank?)
      str.gsub!(/\n/, '</br>')
    end
  
    #
    def erase_spaces(str)
      return str if (str.nil? || str.blank?)
      str.gsub!(/\s/, '')
    end
  
    #
    def unique_id(key)
      @unique_ids = Hash.new() if @unique_ids.nil?
      @unique_ids[key] = 0 if @unique_ids[key].nil?
      @unique_ids[key] += 1
      last_id(key)
    end
  
    # 
    def last_id(key)
      key + "." + @unique_ids[key].to_s
    end
  
  end
end