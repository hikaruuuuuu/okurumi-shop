class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|
      t.string :first_name, null:false
      t.string :last_name, null: false
      t.string :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string :address, null: false
      t.string :building_number, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
