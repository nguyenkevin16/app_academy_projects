class CreateCat2s < ActiveRecord::Migration
  def change
    create_table :cat2s do |t|

      t.timestamps null: false
    end
  end
end
