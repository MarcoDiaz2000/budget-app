class Entity < ApplicationRecord
  belongs_to :user
  has_many :group_entities
  has_many :groups, through: :group_entities

  validates :name, presence: true
end
