class AddPackages < ActiveRecord::Migration
  def change
  	add_column :users, :package, :string
  end
end
