class WikisController < ApplicationController
  before_action :require_sign_in, except: :show

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]

    if @wiki.save
      flash[:notice] = "Your wiki has been added to Blocipedia"
      redirect_to @wiki
    else
      flash.now[:alert] = "Your wiki couldn't be saved"
      redirect_to :create
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
