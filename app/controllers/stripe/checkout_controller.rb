class Stripe::CheckoutController < ApplicationController
  before_action :authenticate_user!

  def pricing
    offers = current_user.offers
    @prices = offers.each_with_object([]) { |offer, prices| prices.push(Stripe::Price.retrieve(offer.stripe_price_id)) }
  end

  def create
    session = Stripe::Checkout::Session.create({
      customer: current_user.stripe_customer_id,
      mode: 'subscription',
      line_items: [{
        quantity: 1,
        price: params[:price_id]
      }],
      success_url: stripe_checkout_success_user_url,
      cancel_url: stripe_checkout_failure_user_url
    })

    redirect_to session.url, allow_other_host: true
  end

  def success
    flash[:notice] = "success"
    redirect_to pricing_path
  end

  def cancel
    flash[:notice] = "failure"
    redirect_to pricing_path
  end
end
