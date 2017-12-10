class AddImageToWikis < ActiveRecord::Migration[5.1]
  def change
    add_column :wikis, :file, :string
  end
end
