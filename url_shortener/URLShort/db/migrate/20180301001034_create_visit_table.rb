class CreateVisitTable < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :url_id
    end
  end
end
