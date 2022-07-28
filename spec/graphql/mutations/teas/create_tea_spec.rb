require "rails_helper"

module Mutations
  module Teas
    RSpec.describe CreateTea, type: :request do
      let!(:tea) { create(:tea, title: "Earl Grey", description: "Herbal", temperature: 101.5, brew_time: 35) }
      describe ".resolve" do
        it "creates a tea" do
          count = Tea.count
          post "/graphql", params: {query: query}
          new_count = count + 1
          expect(Tea.count).to eq(new_count)
        end

        it "returns a tea" do
          post "/graphql", params: {query: query}
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createTea]
          expect(data[:title]).to eq("Earl Grey")
          expect(data[:description]).to eq("Herbal")
          expect(data[:temperature]).to eq(101.5)
          expect(data[:brewTime]).to eq(35)
        end
      end

      def query
        <<~GQL
          mutation {
            createTea(
            input: {
              title: "Earl Grey"
              description: "Herbal"
              temperature: 101.5
              brewTime: 35
            }
            ) {
              title
              description
              temperature
              brewTime
              }
            }
        GQL
      end
    end
  end
end
