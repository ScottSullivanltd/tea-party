module Mutations
  module Subscriptions
    class UpdateSubscription < ::Mutations::BaseMutation
      argument :customer_id, Integer, required: true
      argument :tea_id, Integer, required: true
      argument :title, String, required: true
      argument :price, Float, required: true
      argument :status, String, required: true
      argument :frequency, String, required: true

      type Types::SubscriptionType

      def resolve(attributes)
        customer_id = attributes[:customer_id]
        customer = Customer.find(customer_id)
        customer.subscriptions.update(attributes).first
      end
    end
  end
end
