class Api::V1::UsersController < Api::V1::ApiBaseController
  def create
    if params['password'].blank? || params['email'].blank? || params['password_confirmation'].blank? || params['password'] != params['password_confirmation']
      render json: { success: false, message: "necessary fields blank or different" } 
    else
      user = User.new(user_params)
      if user.save
        role = Role.find_by_code('user')
        user.roles << role
        render json: { success: true, user: user }
      else
        render json: { success: false, message: "Could not create user" }
      end
    end
  end

  private

  def user_params
    params.permit(
      :name,
      :lastname,
      :email,
      :password,
      :password_confirmation
    )
  end
end
