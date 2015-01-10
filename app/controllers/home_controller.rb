class HomeController < ApplicationController
	def index

	end 

	def search
		@search=Book.select('books.*').where("books.title like ? OR books.subject like?", "%#{params[:search_p]}%","%#{params[:search_p]}%")
		respond_to do |format|
	      format.js {  }
	       format.html {  }
	   end	
	end
end
