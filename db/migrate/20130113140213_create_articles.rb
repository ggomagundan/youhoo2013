class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :popularity
      t.string :photo_id

      t.timestamps
    end
  end
end
