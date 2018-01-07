class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end

    if current_user
      if @identity.user == current_user
        redirect_to root_url, notice: "#{I18n.t 'user.already_linked'}"
      else
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "#{I18n.t 'user.linked'}"
      end
    else
      if @identity.user.present?
        sign_in @identity.user
        redirect_to root_url, notice: "#{I18n.t 'user.logged_in'}"
      else
        if User.find_by_email(auth[:info][:email])
          redirect_to root_url, flash: { error: "#{I18n.t 'user.error_sign_up'}" }
        else
          @identity.user = User.create_with_omniauth(auth)
          @identity.save
          sign_in @identity.user
          redirect_to root_url, notice: "#{I18n.t 'user.logged_in'}"
        end
      end
    end
  end

  def destroy
    sign_out :user
    redirect_to root_url, notice: "Signed out!"
  end
end
