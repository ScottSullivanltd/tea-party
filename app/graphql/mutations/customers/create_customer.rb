module Mutations
  module Customers
    class CreateCustomer < ::Mutations::BaseMutation
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :address, String, required: true

      type Types::CustomerType

      def resolve(attributes)
        customer = Customer.create(attributes)
      end
    end
  end
end
