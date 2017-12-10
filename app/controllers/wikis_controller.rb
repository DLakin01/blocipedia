class WikisController < ApplicationController

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new( wiki_params )

    if @wiki.save
      flash[:notice] = "Your wiki has been added to Blocipedia"
      redirect_to @wiki
    else
      flash.now[:alert] = "Your wiki couldn't be saved"
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated!"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "Your wiki could not be deleted. Please try again."
    end
  end

  private
  # expect these 4 attriubtes
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private, :user)
    end
end
