namespace :imdb do
  desc "Pulling in data from imdb into movie model"
  task :pull => :environment do

  	letters = ['a']
  	letters.each do |letter|
  		@search = Imdb::Search.new(letter)
  		@search.each do |movies|
  			Movie.create!(:cast_member_ids => movies.cast_member_ids, :cast_members => movies.cast_members, :director => movies.director, :genres => movies.genres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title)  		end
  		end
  	end

end
