class CreateTagging < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.integer :topic_id, null:false
      t.integer :url_id, null:false
      t.timestamps
    end
    add_index :taggings, :topic_id
    add_index :taggings, :url_id
  end
end
