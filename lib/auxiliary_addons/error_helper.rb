module AuxiliaryAddons
  module ErrorHelper
    # ::Rails.logger.error("...")

    #
    # Common helpers to error processing
    #
    # Check is error or not for fields
    def is_error_message_on(object, method)
      object = instance_variable_get("@#{object}")
      if object.nil? || !object.errors.on(method)
        return true
      end
      return false
    end

    # Show hint on the fields if error not exists
    def hint_message_on(object, method, hint, css_class = "formHint")
      return if !is_error_message_on(object, method)
      content_tag("div", hint, :class => css_class)
    end

  end
end