class Application < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :home_description, presence: true
  has_many :pet_applications
  has_many :pets, through: :pet_applications

  after_initialize do |application|
     application.status = 'In Progress' if !application.status
   end
end