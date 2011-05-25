module AuxiliaryAddons
  # contains auxiliary functions to build conditions
  module FilterUtils
    # ::Rails.logger.error("...")
  
    def self.like
      lambda do |col_name, field_name, field_value| 
        field_value.size()==0 ? nil : "(#{col_name} like :#{field_name})"
      end
    end
  
    def self.less_than 
      lambda do |col_name, field_name, field_value| 
        field_value.size()==0 ? nil : "(#{col_name} < :#{field_name})"
      end
    end
  
    def self.more_than 
      lambda do |col_name, field_name, field_value| 
        field_value.size()==0 ? nil : "(#{col_name} > :#{field_name})"
      end
    end
  
    # the first parameter is a hash containing the values for each key
    # the second parameter is a hash containing filter specs for each key
    # the return value is the condition string to pass to the find method
    def self.get_conditions(filter,filter_spec)
      conditions = ""
      filter_spec.each do |k,spec| 
        if spec.class == Array
          r = spec[1].call(spec[0].to_s,k.to_s,filter[k])
        else
          r = spec.call(k.to_s,k.to_s,filter[k])
        end
        if r
          conditions = conditions + (conditions.size()>0? " and "+r : r)
        end
      end
      return conditions
    end
    
  end
end