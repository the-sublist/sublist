class AddDefaultToActiveOnRequests < ActiveRecord::Migration
  def change
    change_column_default :requests, :active, true
  end
end
