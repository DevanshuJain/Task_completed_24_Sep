class BookController < ApplicationController
  def index
    @books = Author.find(params["format"]).books
  end

  def new
    @author = Author.find_by_id(params["author_id"])
    @book = @author.books.new
  end

  def edit
    @author = Author.find_by_id(params["author_id"])
    @book = @author.books.find_by_id(params[:id])
  end

  def update
    @author = Author.find_by_id(params["author_id"])
    @book = Book.update(author_id: params["author_id"], book_title: params[:book][:book_title])
    redirect_to author_index_path

    # @book = @author.books.find_by_id(params[:id])
    # @update_book = @book.update(book_params)
    # if @update_book.save
    #   redirect_to author_index_path
    # else
    #   render 'new'
    # end
  end

  def create
    @author = Author.find_by_id(params["author_id"])
    @book = Book.create(author_id: params["author_id"], book_title: params[:book][:book_title])
    redirect_to author_index_path

     # @book = @author.books.find_by_id(params[:id])
    # @update_book = @book.new(book_params)
    # if @update_book.save
    #   redirect_to author_index_path
    # else
    #   render 'new'
    # end
  end

  def destroy
    @book = Book.find_by_id(params["id"])
    @destroy_book = @book.update(author_id: "0")
    redirect_to author_index_path
  end

  private
  def book_params
    params.require(:book).permit(:book_title)
  end

end
