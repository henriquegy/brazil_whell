class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string    :name
      t.string    :employee_code
      t.datetime  :deleted_at

      t.timestamps
    end
  end
end
