namespace :imdb do
  desc "Pulling in data from imdb into movie model"
  task :pull => :environment do


  	letters = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']


  	letters.each do |letter|
  		Imdb::Search.new(letter).movies.each do |movies|

  			Movie.create(:cast_member_ids => movies.cast_member_ids, :cast_members => movies.cast_members, :director => movies.director, :genres => movies.genres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end

  desc "Pulling in now playing data from themoviedb into movie model"
  task :upcoming => :environment do

  	Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

  	a = Tmdb::Movie.now_playing
  	
 			a.each do |letter|
  		Imdb::Search.new(letter["title"]).movies.each do |movies|

  			Movie.create(:cast_member_ids => movies.cast_member_ids, :cast_members => movies.cast_members, :director => movies.director, :genres => movies.genres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end



end