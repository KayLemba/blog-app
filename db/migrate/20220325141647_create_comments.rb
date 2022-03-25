class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :users, null: false, foriegn_key: true, index:true
      t.references :posts, null: false, foriegn_key: true, index:true

      t.timestamps
    end
  end
end
