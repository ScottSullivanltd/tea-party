module Types
  class CustomerType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :email, String
    field :address, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
