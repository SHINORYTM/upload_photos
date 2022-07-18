class PhotosController < ApplicationController
  before_action :check_authenticate

  def index
    @oauth_token_presence = session[:oauth_access_token].present?
    @photos = current_user.photos.order(created_at: :desc)
  end

  def new
    @photo = current_user.photos.build
  end

  def create
    @photo = current_user.photos.build(
      title: create_params[:title],
      filename: create_params[:image]&.original_filename
    )

    if @photo.save
      File.binwrite("app/assets/images/#{@photo.filename}", create_params[:image].read)

      redirect_to root_path
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:photo).permit(:title, :image)
  end
end
  