class AddLocationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :home_town, :string
  	add_column :users, :home_region, :string
  	add_column :users, :home_zip, :string
  	add_column :users, :home_neighborhood, :string
  end
end
