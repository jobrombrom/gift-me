class GiftsController < ApplicationController
  def index
    @shortlist = Shortlist.find(params[:shortlist_id])
    @gifts = Gift.all
  end
end
