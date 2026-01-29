class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :date
      t.string :diagnosis
      t.string :medication

      t.timestamps
    end
  end
end
