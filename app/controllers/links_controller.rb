class LinksController < ApplicationController
  def index
    @link_presenter = LinkPresenter.new(Link.where(user_id: current_user.id), Link.new)
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.save
      redirect_to links_path
    else
      flash[:notice] = "Must enter a valid link"
      redirect_to links_path
    end
  end

  def update
    link = Link.find(params[:link_id])
    link.status ? link.status = false : link.status = true
    link.save
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :status)
  end
end
