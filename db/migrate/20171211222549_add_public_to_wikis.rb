class AddPublicToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :public, :boolean
  end
end
