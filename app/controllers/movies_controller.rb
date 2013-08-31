class MoviesController < ApplicationController



	def index


  	@q = Movie.search(params[:q])
  	# puts "_________"
  	# puts params[:q]
   # 	puts "_________"

  	if params[:q]
			@result = @q.result(:distinct => true)
		else
			@result = {}
		end




		# @movies = Movie.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.js
    #   format.json { render json: @result }
    # end

		# a = Imdb::Top250.new.movies
		# binding.pry
	end








end
