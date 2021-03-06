require 'json'

class GiftsController < ApplicationController
  def index
    @shortlist = Shortlist.find(params[:shortlist_id])
    @interests = @shortlist.interest.split('"')
    @interests.select! { |i| i =~ /[A-Z]/ }
    raise
    @gifts = []
    @interests.each do |interest|
      @gifts << Gift.find_by_sql("SELECT * FROM gifts WHERE main_category = '#{interest}';")
    end
  end
end
