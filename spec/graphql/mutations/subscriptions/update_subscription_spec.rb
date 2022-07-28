require "rails_helper"

module Mutations
  module Subscriptions
    RSpec.describe UpdateSubscription, type: :request do
      let!(:customer) { create(:customer, first_name: "Dani", last_name: "Coleman", email: "dani@coleman.ltd", address: "123 My Street, Denver, CO 80002") }
      let!(:tea) { create(:tea, title: "Earl Grey", description: "Herbal", temperature: 101.5, brew_time: 35) }
      describe ".resolve" do
        it "updates a subscription" do
          customer.subscriptions.create!(title: "Earl Grey", price: 12.95, status: "active", frequency: "monthly", tea_id: tea.id)

          expect(customer.subscriptions[0].title).to eq("Earl Grey")
          expect(customer.subscriptions[0].price).to eq(12.95)
          expect(customer.subscriptions[0].status).to eq("active")
          expect(customer.subscriptions[0].frequency).to eq("monthly")

          post "/graphql", params: {query: query}
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:updateSubscription]

          expect(data[:title]).to eq("Earl Grey")
          expect(data[:price]).to eq(12.95)
          expect(data[:status]).to eq("cancelled")
          expect(data[:frequency]).to eq("monthly")
        end
      end

      def query
        <<~GQL
          mutation {
            updateSubscription(
            input: {
              title: "Earl Grey"
              price: 12.95
              status: "cancelled"
              frequency: "monthly"
              customerId: #{customer.id}
              teaId: #{tea.id}
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
