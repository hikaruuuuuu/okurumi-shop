class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, foreignkey: true
      t.references :user_info, foreignkey: true
      t.references :item, foreignkey: true
      t.timestamps
    end
  end
end
