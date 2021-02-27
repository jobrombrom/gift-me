class SessionGiftsController < ApplicationController
  def create
    @session_gift = SessionGift.new(session_gift_parameters)
    @shortlist = @session_gift.shortlist
    if @session_gift.save
      redirect_to shortlist_gifts_path(@shortlist)
    else
      redirect_to shortlist_new_path
    end
  end

  private

  def session_gift_parameters
    params.permit([:gift_id, :shortlist_id])
  end
end
