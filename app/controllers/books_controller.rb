class BooksController < ApplicationController
  def new
    @book = Book.new
  end

def create
    @booknew = Book.new
    @user =  current_user.id
  if @booknew.save
    redirect_to book_path(@book.id), notice: 'Book was successfully created'
  else
    @books = Book.all
    render :index
  end
end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @user = User.find(@book.user_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated!'
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.permit(:title, :body)
  end

end
