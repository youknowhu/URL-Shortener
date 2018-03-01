class AddIndexToVisitsTable < ActiveRecord::Migration[5.1]
  def change
    add_index :visits, [:user_id, :url_id]
  end
end
