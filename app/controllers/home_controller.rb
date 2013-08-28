class HomeController < ApplicationController



	def index
		@search = Imdb::Search.new(params[:query])
		binding.pry
	end







end
