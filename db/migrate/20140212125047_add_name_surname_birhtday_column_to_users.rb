class AddNameSurnameBirhtdayColumnToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string, :null => false, :default => ""
  	add_column :users, :surname, :string, :null => false, :default => ""
  	add_column :users, :birthday, :date
  end
end
