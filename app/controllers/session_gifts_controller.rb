class SessionGiftsController < ApplicationController
  def create
    @session_gift = SessionGift.new(session_gift_parameters)
    @added = params[:added]
    @shortlist = @session_gift.shortlist

    respond_to do |format|
      if @added == 'false'
        format.js
      elsif @session_gift.save
        format.js
      else
        format.html { redirect_to shortlist_new_path }
      end
    end
  end

  def destroy
    @session_gift = SessionGift.find(params[:id])
    @shortlist = @session_gift.shortlist
    respond_to do |format|
      format.js
    end
    @session_gift.destroy!
  end

  def show
    @session_gift = SessionGift.find(params[:id])
  end

  private

  def session_gift_parameters
    params.permit([:gift_id, :shortlist_id])
  end
end
