class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author, null: false, foriegn_key: true, index:true
      t.references :posts, null: false, foriegn_key: true, index:true

      t.timestamps
    end
  end
end
