# frozen_string_literal: true

class PagesController < ApplicationController

  layout :resolve_layout

  # About page
  def about; end

  # Code of conduct page
  def rules; end

  # Speakers page for the Show & Tell
  def speakers; end

  # Schedule page for the Show & Tell
  def schedule; end

  private
  # Sets the 'application' layout for the 'about' page
  def resolve_layout
    if action_name == "about"
      "application"
    end
  end
end
