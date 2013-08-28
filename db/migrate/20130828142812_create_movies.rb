class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :cast_member_ids
      t.string :cast_members
      t.string :director
      t.string :genres
      t.string :length
      t.text :plot
      t.string :poster
      t.string :rating
      t.string :release_date
      t.text :tagline
      t.string :trailer_url

      t.timestamps
    end
  end
end
