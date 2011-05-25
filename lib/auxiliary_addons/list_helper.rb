module AuxiliaryAddons
  module ListHelper
    # ::Rails.logger.error("...")
  
    #
    # Common pagin and sorting helpers
    #
  
    def checkable_field_header
      output = check_box_tag "ids[]", 0, false, {:id => "ids_", :onclick => "checkedAll('list',this.checked);"}
      output
    end
  
    def sortable_field_header (header_name, field_name, form_name = nil)
      url_params = Hash.new
      if form_name.nil?
        if @orderby == field_name
          url_params[:orderby] = field_name + " desc"
        else
          url_params[:orderby] = field_name
        end
      else
        if @orderby[form_name] == field_name
          url_params["orderby[#{form_name}]"] = field_name + " desc"
        else
          url_params["orderby[#{form_name}]"] = field_name
        end
        @orderby.each do |form, sorter|
          unless form.to_s == form_name.to_s
            url_params["orderby[#{form}]"] = sorter
          end
        end
      end
  
      # sort links should preserve GET parameters
      if request.get?
        request.params.each do |key, value|
          next if key == 'controller'
          next if key == 'action'
          next if key == 'orderby'
          next if key.starts_with?('orderby[')
          url_params[key] = value
        end
      end
      url_params.delete("page")
  
      output = link_to header_name, url_params
      output += "&nbsp;"+ image_tag("markers/arrow-down.png") if @orderby == field_name
      output += "&nbsp;"+ image_tag("markers/arrow-up.png") if @orderby == field_name + " desc"
      output
    end
  
  end
end