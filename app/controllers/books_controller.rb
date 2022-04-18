class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  
  
  def index
    @books=Book.all
    @new=Book.new
    @user=current_user
  end
  
  def edit
    @book=Book.find(params[:id])
  end
  
  def show
    @book=Book.find(params[:id])
    @new=Book.new
    
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
      redirect_to books_path
    else
      render book_path(@book) 
    end
  end

  def create
    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
      flash[:notice] = "successfully" 
      redirect_to "/books/#{@new.id}"
    else
      @books=Book.all
      @user=current_user
      render :index
    end
  end
  
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully" 
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
  
  

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
