class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.text :answer
      t.integer :user_id
      t.integer :query_id
      t.integer :rating, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
