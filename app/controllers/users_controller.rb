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
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end