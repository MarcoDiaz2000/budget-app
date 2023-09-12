class Group < ApplicationRecord
  belongs_to :user
  has_many :group_entities
  has_many :entities, through: :group_entities

  validates :name, presence: true
end
