module Mutations
  module Teas
    class CreateTea < ::Mutations::BaseMutation
      argument :title, String, required: true
      argument :description, String, required: true
      argument :temperature, Float, required: true
      argument :brew_time, Integer, required: true

      type Types::TeaType

      def resolve(attributes)
        tea = Tea.create(attributes)
      end
    end
  end
end
