class ModifyGoals < ActiveRecord::Migration
  def change
    change_column :goals, :privacy, :boolean, null: false, default: true
    change_column :goals, :complete, :boolean, null: false, default: false
  end
end
