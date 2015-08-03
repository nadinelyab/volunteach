class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.string :title
      t.string :body
      t.integer :receiver_id
      t.boolean :read

      t.timestamps null: false
    end
  end
end
