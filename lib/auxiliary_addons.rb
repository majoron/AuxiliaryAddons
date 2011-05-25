# Include
require 'rubygems'
require 'active_support'
require 'auxiliary_addons/error_helper'
require 'auxiliary_addons/filter_utils'
require 'auxiliary_addons/form_helper'
require 'auxiliary_addons/html_helper'
require 'auxiliary_addons/jscript_helper'
require 'auxiliary_addons/list_helper'
require 'auxiliary_addons/ruby_addons'
require 'auxiliary_addons/tableless'

# =
#
module AuxiliaryAddons
  def self.enable_activerecord
    ActiveRecord::Base.class_eval do
      # Include into model
      include AuxiliaryAddons::RubyAddons
      include AuxiliaryAddons::FilterUtils
    end
  end

  def self.enable_actionpack
    ActionController::Base.class_eval do
      # Include into controller
      include AuxiliaryAddons::RubyAddons
    end
    ActionView::Base.class_eval do
      # Include into views
      include AuxiliaryAddons::RubyAddons
      include AuxiliaryAddons::ErrorHelper
      include AuxiliaryAddons::FormHelper
      include AuxiliaryAddons::HtmlHelper
      include AuxiliaryAddons::JscriptHelper
      include AuxiliaryAddons::ListHelper
    end
  end
end

if defined? Rails
  AuxiliaryAddons.enable_activerecord if defined? ActiveRecord
  AuxiliaryAddons.enable_actionpack if defined? ActionController
end
