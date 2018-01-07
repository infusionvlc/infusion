class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end

    if current_user
      if @identity.user == current_user
        redirect_to root_url, notice: "Already linked that account!"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      if @identity.user.present?
        sign_in @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        if User.find_by_email(auth[:info][:email])
          redirect_to root_url, flash: { error: "Another user account exists with your associated email! Please log in to link your social account" }
        else
          @identity.user = User.create_with_omniauth(auth)
          @identity.save
          sign_in @identity.user
          redirect_to root_url, notice: "Welcome!"
        end
      end
    end
  end

  def destroy
    sign_out :user
    redirect_to root_url, notice: "Signed out!"
  end
end
