class BooksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @book = Book.new
  end

  def create
    @booknew = Book.new(book_params) #books_paramsかもです。ストロングパラメーターを確認してください。
    @booknew.user_id =  current_user.id #@booknewには、↑のコードでtitleやdescriptionは入ったので、idをいれてあげます。book.user_idとかで、入れるべき場所を参照できます。
    @user = current_user
  if @booknew.save #ちゃんと中身を入れて保存する
    redirect_to book_path(@booknew.id), notice: 'Book was successfully created'  #pathがおかしいですよね。@bookなんてものはここまでで定義されていません。@booknewです。
  else
    @books = Book.all
    render :index
  end
end

  def index
    @books = Book.all
    @booknew = Book.new
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
    if @book.user == current_user #view画面ではテストが通らなかったため、
      render "edit"
  else
    redirect_to books_path
  end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated!'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
