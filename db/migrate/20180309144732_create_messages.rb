class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.timestamps
      t.references :user, null: false
    end
  end
end
