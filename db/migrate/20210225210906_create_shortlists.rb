class CreateShortlists < ActiveRecord::Migration[6.0]
  def change
    create_table :shortlists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :recipient_name, null: false
      t.timestamps
    end
  end
end
