class Api::V1::ApiBaseController < ApplicationController
  def authenticate_user
    token = request.headers['AuthToken']
    @current_session = Session.find_by_token(token)

    render json: { success: false }, status: 401 if @current_session.blank? || Time.now > @current_session&.valid_to

    @current_session
  end

  def current_user
    @current_user ||= @current_session&.user

    @current_user
  end
end
