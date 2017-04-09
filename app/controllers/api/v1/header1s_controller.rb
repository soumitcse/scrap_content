class Api::V1::Header1sController < ApiController
  before_action :set_id

  def index
    if Welcome.exists?(id: @id )
      @header1s =  Welcome.find(@id).header1s
      render json: @header1s
    else
      # format.json { render json: @link_url.errors, status: :unprocessable_entity }
      # byebug
      # render :json => @link_url, :status => "unsuccessfully"
      render :json => {:error => "not-found"}.to_json, :status => 404
    end

  end

  private

  def set_id
    # @link_url =  Welcome.find(params[:welcome_id]).link_urls
     @id = params[:welcome_id]
  end
end
