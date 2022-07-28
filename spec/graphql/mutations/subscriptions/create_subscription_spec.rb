require "rails_helper"

module Mutations
  module Subscriptions
    RSpec.describe CreateSubscription, type: :request do
      let!(:customer) { create(:customer, first_name: "Dani", last_name: "Coleman", email: "dani@coleman.ltd", address: "123 My Street, Denver, CO 80002") }
      let!(:tea) { create(:tea, title: "Earl Grey", description: "Herbal", temperature: 101.5, brew_time: 35) }
      describe ".resolve" do
        it "creates a subscription" do
          count = Subscription.count
          post "/graphql", params: {query: query}
          new_count = count + 1
          expect(Subscription.count).to eq(new_count)
        end

        it "returns a subscription" do
          post "/graphql", params: {query: query}
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createSubscription]
          expect(data[:title]).to eq("Earl Grey")
          expect(data[:price]).to eq(12.95)
          expect(data[:status]).to eq("active")
          expect(data[:frequency]).to eq("monthly")
        end
      end

      def query
        <<~GQL
          mutation {
            createSubscription(
            input: {
              title: "Earl Grey"
              price: 12.95
              status: "active"
              frequency: "monthly"
              customerId: #{Customer.last.id}
              teaId: #{Tea.last.id}
            }
            ) {
              title
              price
              status
              frequency
              customerId
              teaId
              }
            }
        GQL
      end
    end
  end
end
