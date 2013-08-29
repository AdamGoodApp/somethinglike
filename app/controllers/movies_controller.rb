class MoviesController < ApplicationController



	def index
		@movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
	end







end
