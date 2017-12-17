class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
    @user = User.find(@wiki.user_id)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.image = params[:wiki][:image]
    @wiki.user_id = current_user.id
    @wiki.public = true

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
    @user = current_user
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
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

  def modify_privacy
    @wiki = Wiki.find(params[:id])
    if @wiki.public == true
      @wiki.public = false
    else
      @wiki.public = true
    end

    if @wiki.save
      flash[:notice] = "The privacy status of \"#{@wiki.title}\" was modified."
      redirect_to @wiki
    else
      flash.now[:alert] = "Your wiki's privacy could not be changed. Please try again."
      render :edit
    end
  end

  private
  # expect these 4 attriubtes
    def wiki_params
      params.require(:wiki).permit(:title, :body, :user_id, :public, :image)
    end
end
