class Stripe::WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    webhook_secret = 'whsec_d64acba987e4fc0433c45932c40e1aff7fdb768f288b06649f5eba1cd4442d7e'
    payload = request.body.read
    if !webhook_secret.empty?
      # Retrieve the event by verifying the signature using the raw body and secret if webhook signing is configured.
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      event = nil

      begin
        event = Stripe::Webhook.construct_event(
          payload, sig_header, webhook_secret
        )
      rescue JSON::ParserError => e
        # Invalid payload
        status 400
        return
      rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts '⚠️  Webhook signature verification failed.'
        status 400
        return
      end
    else
      data = JSON.parse(payload, symbolize_names: true)
      event = Stripe::Event.construct_from(data)
    end

    event_type = event['type']
    data = event['data']
    data_object = data['object']

    case event.type

    when 'customer.created'
      customer = event.data.object
      user = User.find_by(email: customer.email)
      user.update(stripe_customer_id: customer.id)

    when 'customer.subscription.deleted'
      puts "Subscription canceled: #{event.id}"

    when 'customer.subscription.updated'
      puts "Subscription updated: #{event.id}"

    when 'customer.subscription.created'
      customer_id = data_object.customer
      user = User.find_by(stripe_customer_id: customer_id)

      fifteen_minutes_at_create = data_object.plan.metadata.fifteen_minutes_per_renewal
      user.update(fifteen_minutes: fifteen_minutes_at_create)

    when 'customer.subscription.trial_will_end'
      puts "Subscription trial will end: #{event.id}"
    end

    render json: { message: 'success' }
  end
end
