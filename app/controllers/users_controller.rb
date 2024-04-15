class UsersController < ApplicationController
  before_action :set_user,only:[:show,:edit,:update]
  def index
    @users = User.all
    @book = Book.new
  end

  def show
    @books = @user.books
    @book = Book.new
  end
  
  def edit
    
      if @user == current_user
        render :edit
      else  
        redirect_to user_path(current_user)
      end
  end
  
  def update
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully"
      redirect_to user_path
    else 
      render :edit
    end 
  end   


  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def set_user
    @user = User.find(params[:id])
  end  
end
