class Movie < ActiveRecord::Base

  attr_accessible :cast_member_ids, :cast_members, :director, :genres, :length, :plot, :poster, :rating, :release_date, :tagline, :trailer_url, :title

  # validates :cast_member_ids, presence: true
  # validates :cast_members, presence: true
  # validates :director, presence: true
  # validates :genres, presence: true
  # validates :length, presence: true
  # validates :plot, presence: true
  # validates :rating, presence: true
  # validates :release_date, presence: true
  # validates :tagline, presence: true
  validates :title, presence: true, uniqueness: true
  # validates :poster, presence: true
  # validates :trailer_url, presence: true


  # before_validation(on: :create) do
  #   binding.pry
  #     [:cast_member_id, :cast_members].each do |field|
  #       send(field) = 'sorry' if send(field).blank?
  #     end


  #   self.cast_member_ids = 'Sorry, no information for cast exists' if self.cast_member_ids == ""
  #   self.cast_members ||= 'Sorry, no information for cast exists'
  #   self.director ||= 'Sorry, no information for director exists'
  #   self.genres ||= 'Sorry, no information for genres exists'
  #   self.length ||= 'Sorry, no information for length exists'
  #   self.plot ||= 'Sorry, no information for plot exists'
  #   self.rating ||= 'Sorry, no rating exists'
  #   self.release_date ||= 'Sorry, no information for release_date exists'
  #   self.tagline ||= 'Sorry, no information for tagline exists'
  #   self.title ||= 'Sorry, no information for title exists'
  #   self.poster ||= 'Sorry, no poster exists'
  #   self.trailer_url ||= 'Sorry, no trailer exists'
  # end

  

end
