class ApplicationController < ActionController::Base
  layout :check_login

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :set_current_user
  before_action :set_user_months

  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def set_locale
    I18n.locale = I18n.default_locale
  end

  def set_current_user
    @current_user = current_user
  end

  def set_user_months
    if user_signed_in?
      @date   = Date.today
      @year   = @date.strftime("%Y")
      @months = @current_user.months.select(:id, :name, :year).where(year: @year)
    end
  end

  private
    def check_login
      user_signed_in? ? "application" : "unsigned"
    end
end
