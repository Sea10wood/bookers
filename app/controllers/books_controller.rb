class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books = Book.all
      flash[:notice] = "error."
      render :index
    end
  end

  def show
    redirect_to books_path, alert: "Book not found." unless @book
  end

  def edit
    
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
       flash[:notice] = "error."
       render :edit
    end
  end

  def destroy
    if @book
      @book.destroy
      redirect_to books_path, notice: "Book was successfully destroyed."
    else
      redirect_to books_path, alert: "Book not found."
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
