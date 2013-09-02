require 'pry'


namespace :imdb do
  desc "Pulling in data from imdb into movie model"
  task :pull => :environment do


  	letters = ("a".."z").to_a
   
  	letters.each do |letter|
  		Imdb::Search.new(letter).movies.each do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

      


  			Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end

  desc "Pulling in now playing data from themoviedb into movie model"
  task :upcoming => :environment do

  	Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

  	a = Tmdb::Movie.now_playing
  	
 			a.each do |letter|
  		Imdb::Search.new(letter["title"]).movies[0..2].collect do |movies|

        castid = movies.cast_member_ids.join(', ')
        castmember = movies.cast_members.join(', ')
        agenres = movies.genres.join(', ')
        adirector = movies.director.join(', ')

  			Movie.create(:cast_member_ids => castid, :cast_members => castmember, :director => adirector, :genres => agenres, :length => movies.length, :plot => movies.plot, :rating => movies.rating, :release_date => movies.release_date, :tagline => movies.tagline, :trailer_url => movies.trailer_url, :title => movies.title, :poster => movies.poster)  		
  		end
  	end
  end



end