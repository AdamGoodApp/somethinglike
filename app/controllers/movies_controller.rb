class MoviesController < ApplicationController



	def index

  	@q = Movie.search(params[:q])

  	if params[:q]
			@movies = @q.result(:distinct => true).order(:poster).page(params[:page]).limit(12)
		else
			@movies = Movie.where("poster != ''").order("created_at ASC").page(params[:page]).limit(12)
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
    @info = Movie.find(params[:id])

    Tmdb::Api.key("0466370d5308dcd864df9ff66953a5f2")

    title = @info.title.gsub!(/\d/, '')
    title = @info.title.gsub!(/\(/, '')
    title = @info.title.gsub!(/\)/, '')
   
    a = Tmdb::Movie.find(title)

    if a != []
    yay = a.first
    id = yay.id

    @similar = Tmdb::Movie.similar_movies(id)
    @cast = Tmdb::Movie.casts(id)
    @images = Tmdb::Movie.images(id)
    @trailers = Tmdb::Movie.trailers(id)
    @backdrops = @images['backdrops']
    @posters = @images['posters']
    @youtube = @trailers['youtube']
    
  	end

  end






end
