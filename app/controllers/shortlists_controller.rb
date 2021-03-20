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
      redirect_to root_path, notice: "Name can't be blank"
    end
  end

  def index
    @shortlist = Shortlist.all
  end

  def destroy
    @shortlist = Shortlist.find(params[:id])
    @shortlist.destroy
    redirect_to shortlists_path
  end

  def show
    @shortlist = Shortlist.find(params[:id])
  end

  private

  def shortlist_params
    params.require(:shortlist).permit(:recipient_name, interest: [])
  end
end
