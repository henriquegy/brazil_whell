class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string    :description
      t.string    :zip_code
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
