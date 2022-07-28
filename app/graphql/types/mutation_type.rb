module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::Customers::CreateCustomer
  end
end
