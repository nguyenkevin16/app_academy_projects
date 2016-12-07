class ChangeLimitonCats < ActiveRecord::Migration
  def change
    change_column :cats, :name, :string, null: false
    change_column :cats, :sex, :string, limit: 1, null: false
  end
end
