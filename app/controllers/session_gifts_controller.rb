class SessionGiftsController < ApplicationController
  def create
    @session_gift = SessionGift.new(session_gift_parameters)
    @shortlist = @session_gift.shortlist

    respond_to do |format|
      if params[:added] == 'false'
        format.html { redirect_to shortlist_gifts_path(@shortlist) }
        format.js
      elsif @session_gift.save
        format.html { redirect_to shortlist_gifts_path(@shortlist) }
        format.js
      else
        format.html { redirect_to shortlist_new_path }
      end
    end
  end

  private

  def session_gift_parameters
    params.permit([:gift_id, :shortlist_id])
  end
end
