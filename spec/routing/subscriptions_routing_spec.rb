require "rails_helper"

RSpec.describe SubscriptionsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "/subscriptions/new").to route_to("subscriptions#new")
    end

    it "routes to #update via POST" do
      expect(post: "/subscriptions/update").to route_to("subscriptions#update")
    end
  end
end
