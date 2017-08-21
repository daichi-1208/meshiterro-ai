class PostImagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@post_images = PostImage.page(params[:page])
	end

	def new
		@post_image = PostImage.new
	end

	def create
		@post_image = PostImage.new(postimage_params)
		@post_image.user_id = current_user.id
		@post_image.save
		redirect_to post_images_path
	end

	def show
		@post_image = PostImage.find(params[:id])
		@post_comment = PostComment.new
	end


	private

	def postimage_params
		params.require(:post_image).permit(:shop_name,
										  :image,
										  :caption,
										  :user_id)
	end
end
