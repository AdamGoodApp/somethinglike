class MoviesController < ApplicationController



	def index

  	@q = Movie.search(params[:q])

  	if params[:q]
			@movies = @q.result(:distinct => true).where("poster != ''").order(:poster).page(params[:page]).limit(12)
		else
			@movies = Movie.where("poster != ''").order("rating DESC").page(params[:page]).limit(12)
		end

		@movie_count = Movie.count

		if params[:id]
		@info = Movie.find(params[:id])
	else
	end


    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.js
    #   format.json { render json: @result }
    # end
	end

	def show

    @info = Movie.find params[:id] 

    Tmdb::Api.key "0466370d5308dcd864df9ff66953a5f2"

    title = @info.title.gsub(/\d/, '').gsub(/\(/, '').gsub(/\)/, '')
 
    tmdb_response = Tmdb::Movie.find title
    tmdb_id = tmdb_response.first.id if tmdb_response.first

    @similar = []

    unless tmdb_response.empty?

      similar_movies = Tmdb::Movie.similar_movies(tmdb_id)[0..4]

      similar_movies.each do |similar_movie|

        movie = Movie.find_or_initialize_by_title similar_movie['title'].gsub(/\d/, '').gsub(/\(/, '').gsub(/\)/, '')

        if movie.new_record?
          imdb_response = Imdb::Search.new(movie.title).movies.first
          movie.cast_member_ids = imdb_response.cast_member_ids.join(', ') 
          movie.cast_members = imdb_response.cast_members.join(', ') 
          movie.director = imdb_response.director.join(', ')
          movie.genres = imdb_response.genres.join(', ')
          movie.length = imdb_response.length
          movie.plot = imdb_response.plot
          movie.rating = imdb_response.rating
          movie.release_date = imdb_response.release_date
          movie.tagline = imdb_response.tagline
          movie.trailer_url = imdb_response.trailer_url
          movie.title = similar_movie['title'].gsub(/\d/, '').gsub(/\(/, '').gsub(/\)/, '')
          movie.poster = imdb_response.poster
          movie.save
        end

        @similar << movie
      end

      @cast = Tmdb::Movie.casts tmdb_id
      @images = Tmdb::Movie.images tmdb_id
      @trailers = Tmdb::Movie.trailers tmdb_id
      @backdrops = @images['backdrops']
      @posters = @images['posters']
      @youtube = @trailers['youtube']


  
	  end

  end

end
