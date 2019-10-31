# frozen_string_literal: true

module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address_country address_city gender])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name address_country address_city gender])
  end
end
