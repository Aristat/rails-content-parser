class WebsitesController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: {
          websites: Website.paginate(page: page).order(created_at: :desc),
          page: page,
          pages: Website.pages
        }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: {
          website: Website.find(params[:id]),
          website_contents: WebsiteContent.where(website_id: params[:id]).as_json
        }
      end
    end
  end

  def create
    @website = Website.new(website_params)

    if !@website.save
      render json: @website.errors, status: :unprocessable_entity and return
    end

    service = Parsing::WebsiteService.new(@website)
    service.parse

    render json: @website
  end

  def update
    @website = Website.find(params[:id])

    if @website.update(website_params)
      render json: @website
    else
      render json: @website.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @website = Website.find(params[:id])
    @website.destroy
    head :no_content
  end

  private

  def website_params
    params.require(:website).permit(:id, :url)
  end

  def page
    params[:page] || 1
  end
end
