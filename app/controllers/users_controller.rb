class UsersController < ApplicationController

  def create
    @book= Book.new(book_params)
    @book.user_id= current_user.id
    @book.save
    redirect_to book_path(@book.user_id)
  end

  def index
    @book= Book.new
    @books= Book.all
    @user= current_user
    @users= User.all

  end

  def show
    @book= Book.new
    @user= User.find(params[:id])
    @books= @user.books
  end

  def edit
    @user= User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)

    end
  end

  def update
    @user= User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    else
      if @user.update(user_params)
        flash[:notice]= "You have updated user successfully."
        redirect_to user_path(@user)
      else
        render:edit
      end
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end