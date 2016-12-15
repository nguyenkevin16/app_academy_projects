class ChangeIndexForTaggings < ActiveRecord::Migration
  def change
    remove_index :taggings, column: [:topic_id, :url_id]

    add_index :taggings, :topic_id
    add_index :taggings, :url_id
  end
end
