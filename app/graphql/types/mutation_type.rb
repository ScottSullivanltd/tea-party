module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::Customers::CreateCustomer
    field :create_tea, mutation: Mutations::Teas::CreateTea
    field :create_subscription, mutation: Mutations::Subscriptions::CreateSubscription
    field :update_subscription, mutation: Mutations::Subscriptions::UpdateSubscription
  end
end
