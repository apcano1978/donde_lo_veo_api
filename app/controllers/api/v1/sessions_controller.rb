class Api::V1::SessionsController < Api::V1::ApiBaseController
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session = user.sessions.create(token: SecureRandom.hex(30), valid_to: 1.year.from_now)
      render json: { success: true, session: session }
    else
      render json: { success: false, message: "Invalid user or password" }, status: 401
    end
  end
end
