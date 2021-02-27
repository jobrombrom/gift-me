class CreateSessionGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :session_gifts do |t|
      t.references :gift, null: false, foreign_key: true
      t.references :shortlist, null: false, foreign_key: true
      t.boolean :selected

      t.timestamps
    end
  end
end
