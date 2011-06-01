#
# See http://railscasts.com/episodes/193-tableless-model
#
class TablelessModel < ActiveRecord::Base

  def self.columns() @columns ||= []; end

  def self.column(name, sql_type = nil, default = nil, null = true)
    columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  end

  def initialize(attributes = nil)
    super(attributes)
  end

end
