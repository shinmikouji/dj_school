class GuestLoginController < ApplicationController
  
  def guest
    user = User.find_or_create_by!(name: "guest", email: 'guest@example.com') do |u|
      u.password = SecureRandom.urlsafe_base64
    end
    log_in user
    redirect_to top_path
  end

  def admin_guest
    admin_user = User.find_or_create_by!(name: "Administrator", email: 'admin@example.com', admin: true) do |u|
      u.password = SecureRandom.urlsafe_base64
    end
    log_in admin
    redirect_to top_path
  end
end