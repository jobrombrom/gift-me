class AddPriceColumnToShortlist < ActiveRecord::Migration[6.0]
  def change
    add_column :shortlists, :price, :string
  end
end
