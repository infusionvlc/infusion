# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy vote]

  def index
    @activities = Activity.all
  end

  private

  def activies_params
    params.require(:activity).permit(
      :user_id,
      :objective_id,
      :objective_type
    )
  end
end

def set_activity
  @activity = Activity.find(params[:id])
rescue StandardError
  redirect_to(activity_path)
end


