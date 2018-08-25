class PagesController < ApplicationController

  layout :resolve_layout

  def about; end

  def rules; end

  def speakers; end

  def schedule; end

  private
  def resolve_layout
    if action_name == "about"
      "application"
    end
  end
end
