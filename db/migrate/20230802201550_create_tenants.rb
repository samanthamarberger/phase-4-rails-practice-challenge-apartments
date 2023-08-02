class CreateTenants < ActiveRecord::Migration[6.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :age
      t.integer :apartment_id

      t.timestamps
    end
  end
end
