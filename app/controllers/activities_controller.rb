class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  private 

  def activies_params
    params.require(:proposal).permit(
      :title,
      :description,
      votes_attributes: [:id, :user_id, :_destroy]
    )
  end
end
