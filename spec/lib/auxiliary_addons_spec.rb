require 'spec_helper'

describe AuxiliaryAddons do
  it "should define rails" do
    ::Rails::VERSION::MAJOR.should be
  end
end
