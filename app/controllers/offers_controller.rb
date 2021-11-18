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
    @reservation = current_user.reservation_for(@offer) || Reservation.new
  end

  def index
    if params[:query].present? || params[:location].present?
      @offers = Offer.search_full_text("#{params[:query]} #{params[:location]}")
    else
      @offers = Offer.all
    end

    @markers = []
    @offers.each do |offer|
      if offer.user.geocoded?
        @markers << {
          lat: offer.user.latitude,
          lng: offer.user.longitude,
          info_window: render_to_string(partial: "info_window", locals: { offer: offer }),
        }
      end
    end
  end

  def reservations
    @offer = Offer.find(params[:id])
    @reservation = Reservation.new(reservation_params)
    @reservation.offer = @offer
    @reservation.user = current_user
    if @reservation.save
      redirect_to offer_path(@offer)
    else
      render :show
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:name, :description, :equipment_type, :equipment_category, :price, photos: [])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
