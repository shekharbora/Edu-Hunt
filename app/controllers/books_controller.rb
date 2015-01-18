class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @books = Book.all.where(:user_id=>current_user.id)
    respond_with(@books)
  end

  def show
    respond_with(@book)
  end

  def new
    @book = Book.new
    respond_with(@book)
  end

  def edit
  end

  def create
    @book = current_user.books.new(book_params)
    # abort @book.to_yaml
    @book.save
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:subject, :title, :file, :description, :user_id)
    end
end
