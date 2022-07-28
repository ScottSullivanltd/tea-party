module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::Customers::CreateCustomer
    field :create_tea, mutation: Mutations::Teas::CreateTea
  end
end
