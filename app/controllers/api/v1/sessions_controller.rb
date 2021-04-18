class Api::V1::SessionsController < Api::V1::ApiBaseController
  before_action :authenticate_user, only: :destroy
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session = user.sessions.create(token: SecureRandom.hex(30), valid_to: 1.year.from_now)
      render json: { success: true, session: session }
    else
      render json: { success: false, message: "Invalid user or password" }, status: 401
    end
  end

  def destroy
    session = Session.find_by_token(request.headers['AuthToken'])
    session.valid_to = 1.day.ago
    if session.save
      render json: { success: true }
    else
      render json: { success: false, message: "Could not close session" }
    end
  end
end
