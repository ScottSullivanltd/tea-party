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

    field :get_tea, Types::TeaType, null: false, description: "Returns a single tea by id" do
      argument :id, ID, required: true
    end

    def get_tea(id:)
      Tea.find(id)
    end

    field :get_customer_subscription, Types::SubscriptionType, null: false, description: "Activates a customer subscription" do
      argument :customer_id, ID, required: true
      argument :tea_id, ID, required: true
    end

    def get_customer_subscription(customer_id:, tea_id:)
      Subscription.where("customer_id = ? AND tea_id = ?", customer_id, tea_id)
    end
  end
end
