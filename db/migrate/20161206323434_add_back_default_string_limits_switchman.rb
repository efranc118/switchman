class AddBackDefaultStringLimitsSwitchman < ActiveRecord::Migration
  def up
    add_string_limit_if_missing :switchman_shards, :name
    add_string_limit_if_missing :switchman_shards, :database_server_id
  end

  def add_string_limit_if_missing(table, column)
    return if column_exists?(table, column, :string, limit: 255)
    change_column table, column, :string, limit: 255
  end
end
