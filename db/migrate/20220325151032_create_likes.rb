class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, null: false, foriegn_key: true, index:true
      t.references :posts, null: false, foriegn_key: true, index:true
      
      t.timestamps
    end
  end
end
