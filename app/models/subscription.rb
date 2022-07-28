class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
  validates_numericality_of :price

  belongs_to :tea
  belongs_to :customer
end
