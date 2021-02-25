class CreateShortlists < ActiveRecord::Migration[6.0]
  def change
    create_table :shortlists do |t|
      t.references :recipients, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
