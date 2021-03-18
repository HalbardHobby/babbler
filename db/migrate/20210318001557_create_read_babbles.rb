class CreateReadBabbles < ActiveRecord::Migration[6.1]
  def change
    create_table :read_babbles do |t|
      t.integer :user_id, null: false
      t.integer :babble_id, null: false
      t.boolean :read, null: false

      t.timestamps
    end
  end
end
