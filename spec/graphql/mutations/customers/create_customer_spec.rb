require "rails_helper"

module Mutations
  module Customers
    RSpec.describe CreateCustomer, type: :request do
      let!(:customer) { create(:customer, first_name: "Dani", last_name: "Coleman", email: "dani@coleman.ltd", address: "123 My Street, Denver, CO 80002") }
      describe ".resolve" do
        it "creates a customer" do
          count = Customer.count
          post "/graphql", params: {query: query}
          new_count = count + 1
          expect(Customer.count).to eq(new_count)
        end

        it "returns a customer" do
          post "/graphql", params: {query: query}
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createCustomer]
          expect(data[:firstName]).to eq("Dani")
          expect(data[:lastName]).to eq("Coleman")
          expect(data[:email]).to eq("dani@coleman.ltd")
          expect(data[:address]).to eq("123 My Street, Denver, CO 80002")
        end
      end

      def query
        <<~GQL
          mutation {
            createCustomer(
            input: {
              firstName: "Dani"
              lastName: "Coleman"
              email: "dani@coleman.ltd"
              address: "123 My Street, Denver, CO 80002"
            }
            ) {
              firstName
              lastName
              email
              address
              }
            }
        GQL
      end
    end
  end
end
