module AuxiliaryAddons
  module JscriptHelper
    # ::Rails.logger.error("...")
    
    #
    # Common JScript helpers
    #
  
    #
    def set_focus_on_load(id)
      javascript_tag("Event.observe(window, 'load', $('#{id}').focus());")
    end
  end
end