class PagesController < ApplicationController
  def home
  end

  def index
    @offers = Offer.all
  end
end
