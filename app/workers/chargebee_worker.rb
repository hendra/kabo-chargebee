class ChargebeeWorker
  include Sidekiq::Worker

  def perform(customer_id, date)
    # Get all the subscription list
    list = ChargeBee::Subscription.list

    # Because the Chargebee API doesn't provide us API to update the subscription using the customer ID
    # then we need to find the subscription ID belongs to customer ID first
    # and use the subscription ID to update the cf_trial_start_date
    list.each do |entry|
      subscription = entry.subscription
      customer = entry.customer

      if customer.id == customer_id
        ChargeBee::Subscription.update(subscription.id, { cf_trial_start_date: subscription.date.strftime('%s') })
      end
    end
  end
end
