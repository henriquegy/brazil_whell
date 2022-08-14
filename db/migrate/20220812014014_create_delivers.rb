class CreateDelivers < ActiveRecord::Migration[5.2]
  def change
    create_table :delivers do |t|
      t.integer     :employee_id
      t.integer     :truck_id
      t.string      :payload_type
      t.integer     :total_items
      t.float       :total_billing
      t.datetime    :delivery_date
      t.datetime    :deleted_at

      t.timestamps
    end
  end
end
