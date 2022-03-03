class AddTimeStampsToTagTopic < ActiveRecord::Migration[5.2]
  def change
    add_column :tag_topics, :created_at, :datetime, null: false
    add_column :tag_topics, :updated_at, :datetime, null: false
  end
end
