class AddDefaultValueToLengthAttribute < ActiveRecord::Migration[5.1]
  def up
  change_column :songs, :length, :integer, default: 1
end

def down
  change_column :songs, :length, :integer, default: nil
end
end
