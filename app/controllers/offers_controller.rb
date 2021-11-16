class OffersController < ApplicationController

  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
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

  private

  def offer_params
    params.require(:offer).permit(:name, :description, :equipment_type, :equipment_category, :price)
  end
end
