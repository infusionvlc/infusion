class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.all
  end

  def set_report
    @report = Report.find(params[:id])
  rescue StandardError
    redirect_to_path(reports_path)
  end
end
