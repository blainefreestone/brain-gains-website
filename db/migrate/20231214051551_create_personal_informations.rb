class CreatePersonalInformations < ActiveRecord::Migration[7.1]
  def change
    create_table :personal_informations do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :street_address
      t.string :city
      t.integer :zipcode
      t.integer :grade

      t.timestamps
    end
  end
end
