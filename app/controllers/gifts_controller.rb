require 'json'

class GiftsController < ApplicationController
  def index
    @shortlist = Shortlist.find(params[:shortlist_id])
    @interests = @shortlist.interest.split('"')
    @interests.select! { |i| i =~ /[A-Z]/ }
    @gifts = Gift.all.filter { |gift| @interests.include?(gift.main_category) }
  end
end
