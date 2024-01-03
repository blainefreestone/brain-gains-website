class Stripe::CheckoutController < ApplicationController
  before_action :authenticate_user!
  
  def pricing
    offers = current_user.offers
    @prices = offers.each_with_object([]) { |offer, prices| prices.push(Stripe::Price.retrieve(offer.stripe_price_id)) }
  end
end
