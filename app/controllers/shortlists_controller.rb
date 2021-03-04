class ShortlistsController < ApplicationController

  def new
    @shortlist = Shortlist.new
  end

  def create
    @shortlist = Shortlist.new(shortlist_params)
    @shortlist.user = current_user
    if @shortlist.save
      redirect_to shortlist_gifts_path(@shortlist)
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  private

  def shortlist_params
    params.require(:shortlist).permit(:recipient_name)
  end
end