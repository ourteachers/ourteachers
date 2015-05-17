class AddAddressToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :address, :string
  end
end
