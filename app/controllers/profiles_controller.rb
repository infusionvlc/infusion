# frozen_string_literal: true

class ProfilesController < ApplicationController

  include MarkdownConcern

  # GET /username
  def show
    @user = User.find_by_username(params[:username])
    @mark = @user.average_rating
  end
end
