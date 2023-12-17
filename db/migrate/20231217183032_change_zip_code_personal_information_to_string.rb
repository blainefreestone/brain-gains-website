class ChangeZipCodePersonalInformationToString < ActiveRecord::Migration[7.1]
  def change
    change_column :personal_informations, :zipcode, :text
  end
end
