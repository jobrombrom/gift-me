require 'json'

class GiftsController < ApplicationController
  def index
    @shortlist = Shortlist.find(params[:shortlist_id])
    @interests = @shortlist.interest.split("/")
    @gifts = []
    @interests.drop(1).each do |interest|
      interest_list = JSON.parse(interest)
      raise
      @gifts << Gift.find_by_sql("SELECT * FROM gifts WHERE main_category = '#{interest_list}';")
    end
  end
end
