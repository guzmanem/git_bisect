class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true

  enum role: { admin: 0, moderator: 1, user: 2 }

  scope :active, -> { where(active: true) }
  scope :by_role, ->(role) { where(role: role) }
end
