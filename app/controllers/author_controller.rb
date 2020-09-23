class AuthorController < ApplicationController
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      redirect_to author_index_path
    else
      render 'edit'
    end

  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      redirect_to author_index_path
    else
      render 'new'
    end
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to author_index_path
    else
      render 'new'
    end
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :Last_name, :date_of_birth)
  end

end
