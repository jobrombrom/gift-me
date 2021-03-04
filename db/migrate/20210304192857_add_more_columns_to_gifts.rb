class AddMoreColumnsToGifts < ActiveRecord::Migration[6.0]
  def change
    add_column :gifts, :description, :text
    add_column :gifts, :link, :string
    add_column :gifts, :image, :string
    add_column :gifts, :price, :string
    add_column :gifts, :main_category, :string
    add_column :gifts, :sub_category, :string
  end
end
