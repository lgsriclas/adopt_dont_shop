class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :pets, dependent: :destroy
end