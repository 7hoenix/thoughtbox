class LinksController < ApplicationController
  def index
    @link_presenter = LinkPresenter.new(Link.all, Link.new)
  end

  def create
    link = Link.new(link_params)
    if link.save
      redirect_to links_path
    else
      flash[:notice] = "Must enter a valid link"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :status)
  end
end
