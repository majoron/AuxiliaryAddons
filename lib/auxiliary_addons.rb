# Include
require 'rubygems'
require 'active_support'
require 'auxiliary_addons/html_helper'
require 'auxiliary_addons/jscript_helper'
require 'auxiliary_addons/list_helper'
require 'auxiliary_addons/ruby_addons'

# Only for Rails 3.x
if Rails::VERSION::MAJOR >= 3
  require 'auxiliary_addons/tableless_model'
  require 'auxiliary_addons/tableless31_model'
  require 'auxiliary_addons/validateable_model'
end

# =
#
module AuxiliaryAddons

  # default options that can be overridden on the global level
  @@options = {
      :use_prototype             => false,      #
      :use_jquery                => true,       #
      :use_jquery_no_conflict    => false,      #
  }
  mattr_reader :options

  def self.enable_activerecord
    ActiveRecord::Base.send :include, AuxiliaryAddons::RubyAddons
  end

  def self.enable_actionpack
    ActionController::Base.send :include, AuxiliaryAddons::RubyAddons

    ActionView::Base.send :include, AuxiliaryAddons::RubyAddons
    ActionView::Base.send :include, AuxiliaryAddons::HtmlHelper
    ActionView::Base.send :include, AuxiliaryAddons::JscriptHelper
    ActionView::Base.send :include, AuxiliaryAddons::ListHelper
  end
end

if defined? Rails
  AuxiliaryAddons.enable_activerecord if defined? ActiveRecord
  AuxiliaryAddons.enable_actionpack if defined? ActionController
end
