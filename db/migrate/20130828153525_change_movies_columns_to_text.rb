class ChangeMoviesColumnsToText < ActiveRecord::Migration
  def change
  	change_table :movies do |t|
      t.change :cast_member_ids, :text
      t.change :cast_members, :text
      t.change :director, :text
      t.change :genres, :text
      t.change :length, :text
      t.change :poster, :text
      t.change :rating, :text
      t.change :release_date, :text
      t.change :trailer_url, :text
    end
  end
end
