class MapsController < ApplicationController
  def show
    @api_key = ENV['GOOGLE_API_KEY']
  end

  def search
    api_key = ENV['GOOGLE_API_KEY']
    location = params[:location]
    radius = params[:radius] || 5000
    type = 'hospital'
    url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{location}&radius=#{radius}&type=#{type}&key=#{api_key}"

    response = HTTParty.get(url)
    @results = response.parsed_response['results']

    respond_to do |format|
      format.json { render json: { results: @results } }
    end
  end
end
