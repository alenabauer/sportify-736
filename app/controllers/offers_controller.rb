class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    offer = Offer.find(params[:id])
    if offer.update(offer_params)
      redirect_to offer_path(offer)
    else
      render :edit
    end
  end

  # POST /offers
  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user

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

    @markers = []
    @offers.each do |offer|
      if offer.user.geocoded?
        @markers << {
          lat: offer.user.latitude,
          lng: offer.user.longitude
        }
      end
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :description, :equipment_type, :equipment_category, :price, photos: [])
  end
end
