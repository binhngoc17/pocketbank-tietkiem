class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

  def search_provider
    return false unless params[:q]
    return false unless params[:q][:product_provider_id_in]

    ids = params[:q][:product_provider_id_in].delete_if(&:blank?)
    if (!params[:q][:product_provider_id_in].blank?) && (ids.count == 1)
      redirect_to yield(ids[0])
      return true
    end
    return false
  end

end
