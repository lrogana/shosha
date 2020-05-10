class AddHstoreExtension < ActiveRecord::Migration[6.0]
  def change
    enable_extension 'hstore'
    add_column :tournaments, :address, :hstore
  end
end
