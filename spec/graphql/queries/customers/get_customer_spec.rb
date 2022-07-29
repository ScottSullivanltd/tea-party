require "rails_helper"

RSpec.describe Types::QueryType do
  describe "display customer" do
    it "can query a single customer" do
      customer = create(:customer, first_name: "Dani", last_name: "Coleman", email: "dani@coleman.ltd", address: "123 My Street, Denver, CO 80002")
      result = TeaPartySchema.execute(query).as_json

      expect(result["data"]["getCustomer"]["firstName"]).to eq("Dani")
      expect(result["data"]["getCustomer"]["lastName"]).to eq("Coleman")
      expect(result["data"]["getCustomer"]["email"]).to eq("dani@coleman.ltd")
      expect(result["data"]["getCustomer"]["address"]).to eq("123 My Street, Denver, CO 80002")
    end
  end

  def query
    <<~GQL
      {
        getCustomer(id: #{Customer.last.id})
        {
          firstName
          lastName
          email
          address
        }
      }
    GQL
  end
end
