class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @form_value = Book.new
  end

  def create
    new_book = Book.new(book_params)
    if new_book.save
      flash[:notice] = 'Book was successfully created.'
      redirect_to book_path(new_book.id)
    else
      @books = Book.all
      @form_value = new_book
      render :index
    end
  end

  def show
  end

  def edit
    @form_value = @book
  end

  def update
    if @book.update(book_params)
      flash[:notice] = 'Book was successfully updated.'
      redirect_to book_path(@book.id)
    else
      @form_value = @book
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = 'Book was successfully destroyed.'
    redirect_to books_path
  end

  ################################
  private
  
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
