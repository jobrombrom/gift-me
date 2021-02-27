class GiftsController < ApplicationController
  def index
    @gifts = Gift.all
  end
end
