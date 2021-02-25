class CreateSessionGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :session_gifts do |t|
      t.references :gifts, null: false, foreign_key: true
      t.references :shortlists, null: false, foreign_key: true
      t.boolean :selected

      t.timestamps
    end
  end
end
