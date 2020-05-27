# frozen_string_literal: true

class PermissionChecker
  def initialize(user)
    @user = user
  end

  def all_permissions
    roles = @user.role_memberships.pluck(:role)
    role_permissions = Role.permissions_for_roles(roles)
    direct_permissions = @user.permissions.pluck(:code)

    [*role_permissions, *direct_permissions].uniq.map(&:to_sym)
  end

  def can?(permission)
    all_permissions.include? permission
  end
end

