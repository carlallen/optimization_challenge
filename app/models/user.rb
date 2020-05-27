# frozen_string_literal: true

class User < ApplicationRecord
  has_many :permissions
  has_many :role_memberships
end
