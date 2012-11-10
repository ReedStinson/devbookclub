class BooksController < ApplicationController

  before_filter :lookup_book

  def index
    @books = Book.all
  end

  def create
    if @book.save
      flash[:notice] = "Your book has been added."
      redirect_to @book
    else
      flash[:error] = "Your book couldn't be saved. #{@book.errors.full_messages.join}"
      render :new
    end
  end

  def update
    if @book.update_attributes(params[:book])
      redirect_to @book
    else
      flash[:error] = @book.errors.full_messages.join
      render :edit
    end
  end

  protected

  def lookup_book
    if params[:id]
      @book = Book.find(params[:id])
    else
      @book = Book.new(params[:book])
    end
  end

end
