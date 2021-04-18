class Api::V1::ApiBaseController < ApplicationController
  def authenticate_user
    token = request.headers['AuthToken']
    @user = User.find_by_token(token)

    @user
  end
end
