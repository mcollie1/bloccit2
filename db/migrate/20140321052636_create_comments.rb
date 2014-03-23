class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, :user, index: true

      t.timestamps
    end
    add_index :comments, :post_id, :user_id
  end
end
