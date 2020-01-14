class ApplicationController < ActionController::API
  prepend_before_action :check_xhr

  rescue_from TypeError do |exception|
    render json: { message: exception }, status: :unprocessable_entity
  end

  def check_xhr
    raise TypeError, 'We support only AJAX requests' unless request.xhr?
  end
end
