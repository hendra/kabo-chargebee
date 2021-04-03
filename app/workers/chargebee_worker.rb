class ChargebeeWorker
  include Sidekiq::Worker

  def perform(customer_id, date)
    list = ChargeBee::Subscription.list

    list.each do |entry|
      subscription = entry.subscription
      customer = entry.customer

      if customer.id == customer_id
        ChargeBee::Subscription.update(subscription.id, { cf_trial_start_date: subscription.date.strftime('%s') })
      end
    end
  end
end
