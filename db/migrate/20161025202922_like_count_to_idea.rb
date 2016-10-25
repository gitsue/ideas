class LikeCountToIdea < ActiveRecord::Migration
  def change
  	add_column :ideas, :likes_count, :integer, default: 0
  end
end
