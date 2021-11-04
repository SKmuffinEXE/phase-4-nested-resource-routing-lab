class UsersController < ApplicationController


  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items
  end

  def index
    if params[:user_id]
      user = find_user
      items = user.items
    else
      items = Item.all
  
    end
    render json: items, include: :user
  end

  private

  def find_user
    User.find(params[:user_id])
  end

end
