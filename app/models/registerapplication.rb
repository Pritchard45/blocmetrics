class Registerapplication < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, length: {minimum: 2}, presence: true, uniqueness: true
  validates :url, length:{minimum: 6}, presence: true, uniqueness: true
end
