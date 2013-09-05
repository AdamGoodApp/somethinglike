class AddTitleToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :title, :text
  end
end
