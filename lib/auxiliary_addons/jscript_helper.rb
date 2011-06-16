module AuxiliaryAddons
  module JscriptHelper
    # ::Rails.logger.error("...")

    #
    # Common JScript helpers
    #

    #
    def set_focus_on_load(id)
      if ::AuxiliaryAddons.options[:use_prototype]
        javascript_tag("Event.observe(window, 'load', $('#{id}').focus());")
      end
      if ::AuxiliaryAddons.options[:use_jquery]
        if ::AuxiliaryAddons.options[:use_jquery_no_conflict]
          javascript_tag("jQuery(document).ready(function(){jQuery('##{id}').focus();});")
        else
          javascript_tag("$(document).ready(function(){$('##{id}').focus();});")
        end
      end
    end

  end
end

