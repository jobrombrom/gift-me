class AddInterestToShortlist < ActiveRecord::Migration[6.0]
  def change
    add_column :shortlists, :interest, :string
  end
end
