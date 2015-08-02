class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :location
      t.string :needs
      t.string :students_age

      t.timestamps null: false
    end
  end
end
