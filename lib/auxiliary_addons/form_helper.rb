module AuxiliaryAddons
  module FormHelper
    # ::Rails.logger.error("...")

    include ActionView::Helpers::FormHelper
    #
    # Common helpers to customize form elements
    #
    # Checks if there is an error for a field of given object defined by given method

    def is_error_message_on(object, method)
      if object.nil? || !object.errors.on(method)
        return false
      end
      true
    end

    #
    # Outputs div block with a hint message related to the field of object defined by method
    # The hint message is printed if there's no error on the field. The message's text is either given
    # by the 'hint' parameter or defined by 'activerecord.hints.models.#{object_name}.attributes.#{method}'
    # key in localization files.
    #
    # Besides usuals options the following one is defined:
    #   :hint_class - CSS class for the hint div
    #
    # Example:
    #     ..
    #     hint_message_on @user, :post, '(use only characters and digits)'
    #     # If there's no error on :post will output: <div class="form-hint">(use only characters and digits)</div>
    #
    def hint_message_on(object, method, hint = '', options = {})
      return if is_error_message_on(object, method)
      if hint.nil? || hint.blank?
        # Here is patcha for rails 3.0.x
        # object_name = ActionController::RecordIdentifier.singular_class_name(object)
        object_name = ActiveModel::Naming.singular(object)
        hint = I18n.t("activerecord.hints.models.#{object_name}.attributes.#{method.to_s}")
      end
      hint_class = options.delete(:hint_class) || 'form-hint'
      content_tag("div", hint, :class => hint_class)
    end

    #
    # Outputs label that appends mandatory symbol (e.g. '*') to the label's text
    # Possible options are the same as for label method plus the following:
    #   :mandatory_symbol - symbol to applend, default is '*'
    #   :symbol_class = CSS class of the span element which surrounds this symbol, default is 'mandatory-field' class
    #
    #     mandatory_label(@user, :post) # Outputs: <label for="user_post">Post<span class="mandatory-field">*</span></label>
    #     ..
    #     mandatory_label(@user, :name, 'User Name', {:mandatory_symbol => '^', :symbol_class => 'red'})
    #     # Outputs: <label for="user_name">User Name<span class="red">^</span></label>
    #
    def mandatory_label(object, method, text = nil, options = {})
        # Here is patcha for rails 3.0.x
        # object_name = ActionController::RecordIdentifier.singular_class_name(object)
        object_name = ActiveModel::Naming.singular(object)
        text = (text.blank? ? nil : text.to_s) || object.class.human_attribute_name(method)
        mandatory_symbol = options.delete(:mandatory_symbol) || '*'
        symbol_class = options.delete(:symbol_class) || 'mandatory-sign'
        label_name = raw( text + "<span class=#{symbol_class}>#{mandatory_symbol}</span>")
        label(object_name, method, label_name, options)
    end

    class CustomizedFormBuilder < ActionView::Helpers::FormBuilder

      # Checks if there is an error for a field defined by given method
      def is_error_message_on(method)
        if @object.nil? || !@object.errors.on(method)
          return false
        end
        true
      end

      #
      # Outputs div block with a hint message related to the field of object defined by method
      # The hint message is printed if there's no error on the field. The message's text is either given
      # by the 'hint' parameter or defined by 'activerecord.hints.models.#{object_name}.attributes.#{method}'
      # key in localization files.
      #
      # Besides usuals options the following one defined:
      #   :hint_class - CSS class for the hint div
      #
      # Example:
      #   form_for :user do |f|
      #     ..
      #     f.hint_message_on :post, '(use only characters and digits)'
      #     # If there's no error on :post will output: <div class="form-hint">(use only characters and digits)</div>
      #
      def hint_message_on(method, hint = '', options = {})
        @template.hint_message_on(@object, method, hint, options)
      end

      #
      # Outputs label that appends mandatory symbol (e.g. '*') to the label's text
      # Possible options are the same as for label method plus the following:
      #   :mandatory_symbol - symbol to applend, default is '*'
      #   :symbol_class - CSS class of the span element which surrounds this symbol, default is 'mandatory-field' class
      #
      # Example:
      #   form_for :user do |f|
      #     ..
      #     f.mandatory_label(:post) # Outputs: <label for="user_post">Post<span class="mandatory-field">*</span></label>
      #     ..
      #     f.mandatory_label(:name, 'User Name', {:mandatory_symbol => '^', :symbol_class => 'red'})
      #     # Outputs: <label for="user_name">User Name<span class="red">^</span></label>
      #
      def mandatory_label(method, text = nil, options = {})
        @template.mandatory_label(@object, method, text, options)
      end
    end

    # Customized version of form_for for our application
    def form_for(record_or_name_or_array, *args, &proc)
      options = args.extract_options!
      super(record_or_name_or_array, *(args << options.merge(:builder => CustomizedFormBuilder)), &proc)
    end

  # Customized version of form_for for our application
    def fields_for(record_or_name_or_array, *args, &proc)
      options = args.extract_options!
      super(record_or_name_or_array, *(args << options.merge(:builder => CustomizedFormBuilder)), &proc)
    end
  end
end