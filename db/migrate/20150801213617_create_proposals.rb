class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :teacher_name
      t.string :teacher_location
      t.string :topic
      t.string :duration
      t.string :target_age
      t.string :language

      t.timestamps null: false
    end
  end
end
