class AddAttributionToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :attribution, :string
  end
end
