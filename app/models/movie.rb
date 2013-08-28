class Movie < ActiveRecord::Base
  attr_accessible :cast_member_ids, :cast_members, :director, :genres, :length, :plot, :poster, :rating, :release_date, :tagline, :trailer_url

  validates :cast_member_ids, presence: true
  validates :cast_members, presence: true
  validates :director, presence: true
  validates :genres, presence: true
  validates :length, presence: true
  validates :plot, presence: true
  validates :rating, presence: true
  validates :release_date, presence: true
  validates :tagline, presence: true
  # validates :trailer_url, presence: true
  # validates :poster, presence: true

end
