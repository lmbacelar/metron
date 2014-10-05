class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_filter :scope_current_tenant

private
  def current_tenant
      @current_tenant ||= Tenant.find_by_subdomain request.subdomain
  end
  helper_method :current_tenant

  def scope_current_tenant &block
    if current_tenant
      current_tenant.scope_schema 'public', &block
    else
      yield
    end
  end
end
