module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :get_customer, Types::CustomerType, null: false, description: "Returns a single customer by id" do
      argument :id, ID, required: true
    end

    def get_customer(id:)
      Customer.find(id)
    end
  end
end
