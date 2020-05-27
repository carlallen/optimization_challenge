# frozen_string_literal: true

class Permission < ApplicationRecord
  PERMISSIONS = %w(
    special_permission
  ).freeze

  belongs_to :user
  validates :code, presence: true, inclusion: { in: PERMISSIONS.map(&:to_s) }
  validates :user, presence: true
end
