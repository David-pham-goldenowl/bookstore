class AuthorsController < ApplicationController
  def index
    @authors = Author.all
    @author = Author.new
  end

  def new
    @author = Author.new
  end

  def show; end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to authors_path }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def destroy
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.destroy
        format.html { redirect_to authors_path, notice: "Success!" }
        format.js
      else
        format.html { redirect_to authors_path, notice: "Failed!" }
        format.js
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:name)
  end
end
