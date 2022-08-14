class CreateTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :trucks do |t|
      t.string    :board_number
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
