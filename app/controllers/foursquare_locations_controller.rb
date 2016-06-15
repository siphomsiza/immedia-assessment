class FoursquareLocationsController < ApplicationController
  def request_location
  end

  def fetch_items_and_save
    max_timestamp = Time.zone.now
    number_of_pages = 20
    begin
      @ins = InstagramItem.instagram_items(max_timestamp: max_timestamp,
                                   max_number_of_pages: number_of_pages,
                                   :latitude => params[:lat],:longitude =>params[:long])
    rescue => e
      flash[:alert] = "Encountered an error when trying to fetch Instagram Item error: #{e.message}"
      @error = true
    end

    unless @ins.present?
      render :request_location
    else
      flash[:notice] = "Instagram Item has been successfully created."
      redirect_to main_app.fowarder_path(fowarder: {action: 'index',model_name: 'instagram_item', section: 'instagram_items', subsection: 'main'})
    end

  end

end
