class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  def status 
    "Pending"
  end
end