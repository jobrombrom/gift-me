class ShortlistsController < ApplicationController
  before_action :find_shortlist, only: [ :show, :destroy, :edit, :update ]


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

  def edit
  end

  def update
    @shortlist.update(shortlist_params)
    redirect_to shortlist_gifts_path(@shortlist)
  end

  def destroy
    @shortlist.destroy
    redirect_to shortlists_path
  end

  def show
  end

  private

  def find_shortlist
    @shortlist = Shortlist.find(params[:id])
  end

  def shortlist_params
    params.require(:shortlist).permit(:recipient_name, interest: [])
  end
end
