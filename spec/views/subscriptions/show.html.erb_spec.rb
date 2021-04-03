require 'rails_helper'

RSpec.describe "subscriptions/show", type: :view do
  before(:each) do
    @subscription = assign(:subscription, Subscription.create!(
      chargebee_customer_id: "Chargebee Customer"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Chargebee Customer/)
  end
end
