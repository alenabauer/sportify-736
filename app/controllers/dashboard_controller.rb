class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    # @my_incoming_reservations = current_user.reservations_as_owner
    @my_incoming_reservations = []
    Reservation.all.each do |r|
      @my_incoming_reservations << r if r.offer.user == current_user
    end
    @my_outgoing_reservations = current_user.reservations
    @my_offers = current_user.offers
  end
end
