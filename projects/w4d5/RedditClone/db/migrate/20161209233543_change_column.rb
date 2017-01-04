class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :posts, :url, :string
  end
end
