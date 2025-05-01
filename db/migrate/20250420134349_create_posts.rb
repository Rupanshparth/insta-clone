class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :image
      t.references :account
      t.string :caption
      t.boolean :active
      t.timestamps

    end
  end
end
