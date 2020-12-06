class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :title, null: false
      t.string     :slug,  null: false
      t.text       :body,  null: false
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end

    add_index :posts, :slug, unique: true
  end
end
