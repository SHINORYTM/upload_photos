class SessionsController < ApplicationController
  before_action :loged_in?, except: :destroy

  def new; end

  def create
    @user = User.find_by(login_id: params[:login_id])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id

      redirect_to root_path
    else
      if @user.present?
        @user.errors.add(:base, 'password is incorrect')
      else
        @user = User.new(login_id: params[:login_id], password_digest: params[:password])
        @user.valid?
      end
      @user.errors.add(:base, 'user does not exist') unless @user.errors.any?


      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:oauth_access_token] = nil

    redirect_to root_path
  end

  private

  def loged_in?
    return if current_user.blank?

    redirect_to root_path
  end
end
