class MoviesController < ApplicationController



	def index

  	@q = Movie.search(params[:q])

  	if params[:q]
			@movies = @q.result(:distinct => true).page(params[:page]).limit(12)
		else
			@movies = Movie.order(:created_at).page(params[:page]).limit(12)
		end

		@movie_count = Movie.count


    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.js
    #   format.json { render json: @result }
    # end

		# a = Imdb::Top250.new.movies
		# binding.pry
	end








end
