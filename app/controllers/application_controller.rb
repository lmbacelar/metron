class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login
  around_filter :scope_current_account

private
  def not_authenticated
      redirect_to login_path, alert: 'Please login first'
  end

  def current_account
    if request.subdomain.present?
      @current_account ||= Account.find_by_subdomain! request.subdomain
    end
  end
  helper_method :current_account

  def scope_current_account &block
    if current_account
      current_account.scope_schema 'public', &block
    else
      yield
    end
  end
end
