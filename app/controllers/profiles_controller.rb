class ProfilesController < ApplicationController

  include MarkdownConcern

  def show
    @user = User.find_by_username(params[:username])
    @mark = @user.average_rating
  end
end
