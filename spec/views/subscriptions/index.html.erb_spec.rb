require 'rails_helper'

RSpec.describe "subscriptions/index", type: :view do
  before(:each) do
    assign(:subscriptions, [
      Subscription.create!(
        chargebee_customer_id: "Chargebee Customer"
      ),
      Subscription.create!(
        chargebee_customer_id: "Chargebee Customer"
      )
    ])
  end

  it "renders a list of subscriptions" do
    render
    assert_select "tr>td", text: "Chargebee Customer".to_s, count: 2
  end
end
