class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name, :phone, :address_1, :address_2, :city, :state, :postal_code
      t.boolean :donor, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :organizations
  end
end
