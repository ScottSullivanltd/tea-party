require "rails_helper"

RSpec.describe Types::QueryType do
  describe "subscribe customer" do
    xit "can activate a customer subscription" do
      customer = create(:customer, first_name: "Dani", last_name: "Coleman", email: "dani@coleman.ltd", address: "123 My Street, Denver, CO 80002")
      tea = create(:tea, title: "Earl Grey", description: "Herbal", temperature: 101.5, brew_time: 35)

      customer.subscriptions.create!(title: "Earl Grey", price: 12.95, status: "active", frequency: "monthly", tea_id: tea.id)

      result = TeaPartySchema.execute(query).as_json

      expect(result["data"]["getCustomerSubscription"][0]["title"]).to eq("Earl Grey")
      expect(result["data"]["getCustomerSubscription"][0]["price"]).to eq(12.95)
      expect(result["data"]["getCustomerSubscription"][0]["status"]).to eq("active")
      expect(result["data"]["getCustomerSubscription"][0]["frequency"]).to eq("monthly")
    end
  end

  def query
    <<~GQL
      {
        getCustomerSubscription(customerId: #{Customer.last.id}, teaId: #{Tea.last.id})
        {(
          title
          price
          status
          frequency
        )}
      }
    GQL
  end
end
