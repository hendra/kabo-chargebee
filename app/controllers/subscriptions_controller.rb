class SubscriptionsController < ApplicationController

  # GET /subscriptions/new
  def new
  end

  # PATCH/PUT /subscriptions/1 or /subscriptions/1.json
  def update
    ChargebeeWorker.perform_async(params['chargebee_customer_id'], params['date'])
    redirect_to '/subscriptions/new', notice: "Subscription was successfully updated."
  end
end
