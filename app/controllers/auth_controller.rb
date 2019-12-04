class AuthController < ApplicationController
  def create
      user = User.find_by(email: params[:email])
      
      if user && user.authenticate(params[:password])
        render json: {
          status: 200,
          data: user.user_obj
        }
      else
        render json: { 
                  status: 401,
                  errors: ['no such user', 'verify credentials and try again or signup']
                }
      end
  end

  def auto_login
    user = User.find(request.headers["Authorization"])

    if user
      render json: {
        status: 200,
        data: user.user_obj
      }
    else
      render json: {
        status: 401,
        errors: ["No user", "Incorrect credentials"]
      }
    end
  end
  
  def destroy

  end

end
