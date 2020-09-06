class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    if current_user.update(user_params)   #updateアクションで保存できた = truth
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end