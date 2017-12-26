class SessionsController < ApplicationController
  
  def create
    auth = request.env['omniauth.auth']
    @identity = Identity.find_with_omniauth(auth)
  
    if @identity.nil?
      @identity = Identity.create_with_omniauth(auth)
    end
  
    if current_user
      puts "signed in"
      if @identity.user == current_user
        puts "already linked"
        redirect_to root_url, notice: "Already linked that account!"
      else
        puts "linking to user"
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: "Successfully linked that account!"
      end
    else
      puts "new session"
      if @identity.user.present?
        puts "just logging in"
        sign_in @identity.user
        redirect_to root_url, notice: "Signed in!"
      else
        puts "new user"
        @identity.user = User.create_with_omniauth(auth)
        @identity.save
        sign_in @identity.user
        redirect_to root_url, notice: "Welcome!"
      end
    end
  end

  def destroy
    sign_out :user
    redirect_to root_url, notice: "Signed out!"
  end
end
