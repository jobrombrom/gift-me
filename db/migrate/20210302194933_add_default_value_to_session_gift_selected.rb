class AddDefaultValueToSessionGiftSelected < ActiveRecord::Migration[6.0]
  def change
    change_column :session_gifts, :selected, :boolean, default: false
  end
end
