class GiftsController < ApplicationController
  def index
    @gift = params[:gift_id]
    @gifts = Gift.all
    if gift_id.nil?
      @gift = @gifts.first
    else
      @gift = Gift.find(gift_id)
    end
  end
end
