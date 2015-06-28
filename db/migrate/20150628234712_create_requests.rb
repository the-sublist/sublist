class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :school
      t.string :request_name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :payment
      t.string :grade
      t.boolean :active

      t.timestamps null: false
    end
  end
end
