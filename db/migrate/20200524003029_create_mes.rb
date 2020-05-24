class CreateMes < ActiveRecord::Migration[6.0]
  def change
    create_table :mes do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
