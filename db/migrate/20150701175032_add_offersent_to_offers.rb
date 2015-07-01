class AddOffersentToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :confirmation_sent, :boolean, default: false
  end
end
