class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show] do
    redirect_to root_path unless is_user?
  end

  def show
    @user = find_user_id
  end

  def edit; end

  def update
    current_user.update
  end
end