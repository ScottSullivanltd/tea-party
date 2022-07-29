require "rails_helper"

RSpec.describe Types::QueryType do
  describe "display tea" do
    it "can query a single tea" do
      tea = create(:tea, title: "Earl Grey", description: "Herbal", temperature: 101.5, brew_time: 35)
      result = TeaPartySchema.execute(query).as_json

      expect(result["data"]["getTea"]["title"]).to eq("Earl Grey")
      expect(result["data"]["getTea"]["description"]).to eq("Herbal")
      expect(result["data"]["getTea"]["temperature"]).to eq(101.5)
      expect(result["data"]["getTea"]["brewTime"]).to eq(35)
    end
  end

  def query
    <<~GQL
      {
        getTea(id: #{Tea.last.id})
        {
          title
          description
          temperature
          brewTime
        }
      }
    GQL
  end
end
