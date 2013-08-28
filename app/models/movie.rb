class Movie < ActiveRecord::Base
  attr_accessible :cast_member_ids, :cast_members, :director, :genres, :length, :plot, :poster, :rating, :release_date, :tagline, :trailer_url
end
