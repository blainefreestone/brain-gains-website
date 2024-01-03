class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.string :stripe_price_id

      t.timestamps
    end
  end
end
