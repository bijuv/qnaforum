class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.string :query
      t.text :description

      t.timestamps
    end
  end
end
