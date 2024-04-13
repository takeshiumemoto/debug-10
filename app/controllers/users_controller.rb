class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @user = current_user
    @books= @user.books
    @book = Book.new
  end
  
  def edit
    @user = current_user
  end   
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user, notice:"You have updated user successfully"
    else 
      render :edit
    end 
  end   


  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
