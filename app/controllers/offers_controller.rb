class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  def update
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)

    if @offer.save
      redirect_to @offer, notice: 'Offer was successfully created.'
    else
      render :new
    end
  end

  def show
    @offer = Offer.find(params[:id])
  end

  def index
    @offers = Offer.all
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :description, :equipment_type, :equipment_category, :price)
  end
end
