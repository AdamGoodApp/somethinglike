class MoviesController < ApplicationController



	def index
		# @movies = Movie.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @movies }
  #   end

  	@q = Movie.search(params[:q])
  	if params[:q]
			@result = @q.result(:distinct => true)
		else
			@result = {}
		end

		a = Imdb::Top250.new.movies
		binding.pry
	end









end
