class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :cpf
      t.string :periodo

      t.timestamps
    end
  end
end
