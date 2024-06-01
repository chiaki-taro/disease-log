class MapsController < ApplicationController
  def show
    @api_key = GOOGLE_API_KEY
  end
end
