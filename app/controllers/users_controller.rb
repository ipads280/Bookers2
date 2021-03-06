class UsersController < ApplicationController
  before_action :authenticate_user!
  
  
  def index
    @users=User.all
    @books=Book.all
    @user=current_user
    @new=Book.new
  end

  def show
    @user=User.find(params[:id])
    @books=@user.books
    @new=Book.new
  end

  def edit
    @user=User.find(params[:id])
    if @user==current_user
      render:edit
    else
      redirect_to user_path(current_user.id)
    end
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "successfully" 
      redirect_to "/books/#{@book.id}"
    else
      @books=Book.all
      @user=current_user
      render :index
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully" 
      redirect_to user_path(@user.id)
    else
      render:edit
    end
  end
  
  

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
