# frozen_string_literal: true

class RoleMembership < ApplicationRecord
  belongs_to :user

  validates :role, presence: true, inclusion: { in: Role::ROLES.map(&:to_s) }
  validates :user, presence: true
end
