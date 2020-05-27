# frozen_string_literal: true

class Role
  ROLES = %w(
    :super_admin
    :admin,
    :user,
    :guest
  ).freeze

  CATEGORIES = {
    real_users: [
      :sign_in
      :view_users
    ],
    admins: [
      :view_user_emails
    ]
  }

  PERMISSIONS = {
   super_admin: [
    *CATEGORIES[:real_users]
    *CATEGORIES[:admins]
    :delete_user
   ],
   admin: [
    *CATEGORIES[:real_users]
    *CATEGORIES[:admins]
   ],
   user: [
    *CATEGORIES[:real_users]
    *CATEGORIES[:admins]
   ],
   guest: []
  }

  def self.permissions_for_roles(role_names)
    roles.slice(*role_names.map(&:to_sym)).values.flatten.uniq
  end
end
