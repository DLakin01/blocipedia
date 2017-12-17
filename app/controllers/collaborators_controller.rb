class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])

    @user = User.where(name: params[:collaborator]).take

    if @user == nil
      flash[:error] = "Collaborator could not be found"
      redirect_to edit_wiki_path(@wiki)
    elsif @wiki.users.include?(@user)
      flash[:error] = "You have already added this collaborator"
      redirect_to edit_wiki_path(@wiki)
    else
      collaborator = @wiki.collaborators.new(user_id: @user.id)

      if collaborator.save
        flash[:notice] = "You have added #{@user.name} as a collaborator on this wiki"
        redirect_to @wiki
      else
        flash.now[:error] = "There was an error adding #{@user.name} as a collaborator. Please try again."
        redirect_to edit_wiki_path
      end
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    @wiki = @collaborator.wiki

    if @collaborator.delete
      flash[:notice] = "You have removed #{@collaborator.user.name} as a collaborator"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error removing #{@collaborator.user.name}. Please try again."
      redirect_to @wiki
    end
  end
end
