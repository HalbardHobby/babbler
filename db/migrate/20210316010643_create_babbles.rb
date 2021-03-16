class CreateBabbles < ActiveRecord::Migration[6.1]
  def change
    create_table :babbles do |t|
      t.text :content
      t.datetime :expires_at
      t.integer :user_id

      t.timestamps
    end
  end
end
