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
    flash[:notice] = "You have successfully subscribed."
    redirect_to pricing_user_path
  end

  def failure
    flash[:notice] = "We were not able to process your subscription."
    redirect_to pricing_user_path
  end
end
