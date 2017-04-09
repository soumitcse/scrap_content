class Api::V1::WelcomesController < ApiController
  before_action :set_links

  def show

  end

  def index
    # render json: @welcome , include: ['header1s' , 'header2s' , 'header3s' , 'link_urls']
    render json: @welcome
  end

  private

  def set_links
    # @urls = Welcome.all
    @welcome = Welcome.all
  end

end
