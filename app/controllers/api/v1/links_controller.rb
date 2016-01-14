class Api::V1::LinksController < ApplicationController
  before_action :authorize
  respond_to :json

  def index
    respond_with Link.where(user_id: current_user.id)
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.save
      respond_with link
    else
      flash[:notice] = "Must enter a valid link and have a title"
      render json: {status: 401}
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    if params[:link_id]
      link = Link.find(params[:link_id])
      link.status ? link.status = false : link.status = true
      link.save
      redirect_to links_path
    else
      link = Link.find(params[:id])
      if link.update(link_params)
        respond_with(link, status: 200, location: api_v1_link_path(link))
      else
        flash[:notice] = "Must enter a valid link"
        render json: link.errors, status: 422
      end
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :status)
  end
end
