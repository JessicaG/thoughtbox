class LinksController < ApplicationController
	before_filter :authorize

	def index	
		@links = @current_user.links
	end

	def new
	end

	def create
		link = Link.new(link_params)
		if link.save
			redirect_to links_path
			flash[:notice] = "You added a link!"
		else
			flash.now[:error] = "Could not save link"
    end
	end

	def show
		@link = Link.find(params[:id])
	end

	def flip_status
    link = Link.find(params[:id])
    link.read = !link.read
    link.save

    redirect_to link_path(link)
  end

	private

	def link_params
		params.require(:link).permit(:title, :url, :user_id)
	end

end
