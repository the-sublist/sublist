class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.boolean :available, default: false
      t.boolean :confirmed, default: false
      t.belongs_to :teacher
      t.belongs_to :request

      t.timestamps null: false
    end
  end
end
