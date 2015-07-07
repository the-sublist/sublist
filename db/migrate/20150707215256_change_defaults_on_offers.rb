class ChangeDefaultsOnOffers < ActiveRecord::Migration
  def change
    change_column_default(:offers, :available, nil)
    change_column_default(:offers, :confirmed, nil)
  end
end
