class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :Last_name
      t.datetime :date_of_birth
      
      t.timestamps null: false
    end
  end
end
