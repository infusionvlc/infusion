# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all.page(params[:page])
    authorize @reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show; end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    authorize @report
    @report.user_id = current_user.id
    @report.status = 0
    if @report.save
      ok_status
    else
      error_status
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    authorize @report
    @report.update(report_params)
    redirect_to reports_path
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    authorize @report
    @report.destroy
    redirect_to reports_path
  end

  private

  # Find current Report object
  def set_report
    @report = Report.find(params[:id])
  rescue StandardError
    redirect_to_path(reports_path)
  end

  # Parameters whitelist for reports
  def report_params
    params.require(:report).permit(:title, :user_id, :type_of,
                                   :reportable_id, :reportable_type,
                                   :description, :status, :status_comment)
  end

  # Defines the desired behaviour after a successful operation
  def ok_status
    respond_to do |format|
      format.html { reportable_path }
      format.json { render :show, status: :created, location: @report }
    end
  end

  # Defines the desired behaviour after a failed operation
  def error_status
    respond_to do |format|
      format.html { reportable_path }
      format.json { render json: @report.errors, status: :unprocessable_entity }
    end
  end

  # Returns a redirection path for the current report's target
  def reportable_path
    case @report.reportable_type
    when 'Meetup'
      redirect_to meetups_path, notice: I18n.t('report.messages.confirmed')
    when 'Proposal'
      redirect_to proposals_path, notice: I18n.t('report.messages.confirmed')
    else
      redirect_to meetups_path, notice: I18n.t('report.messages.confirmed')
    end
  end
end
