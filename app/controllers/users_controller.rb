class UsersController < ApplicationController
  def sign_in
    if user_signed_in?
      redirect_to home_path
    else
      render template: 'devise/sessions/new',
        locals: {
          resource: User.new,
          resource_name: :user,
          devise_mapping: Devise.mappings[:user]
        }
    end
  end
end
