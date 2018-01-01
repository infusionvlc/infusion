class ProposalsController < ApplicationController
  before_action :set_proposal, only: %i[show edit update destroy vote]

  # GET /proposals
  # GET /proposals.json
  def index
    @proposals = Proposal.all
  end

  # GET /proposals/1
  # GET /proposals/1.json
  def show
    authorize @proposal
  end

  # POST /proposals/1/vote
  # POST /proposals/1/vote.json
  def vote
    authorize @proposal
    @proposal.votes.create(user_id: current_user.id)
    redirect_to(proposal_path(@proposal))
  end

  # GET /proposals/new
  def new
    @proposal = Proposal.new
    authorize @proposal
  end

  # GET /proposals/1/edit
  def edit
    authorize @proposal
  end

  # POST /proposals
  # POST /proposals.json
  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    authorize @proposal
    respond_to do |format|
      if @proposal.save
        @proposal.votes.create(user_id: current_user.id)
        format.html { redirect_to proposal_path(@proposal) }
        format.json do
          render :show,
                 status: :created, location: @proposal
        end
      else
        format.html { render :new }
        format.json do
          render json: @proposal.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /proposals/1
  # PATCH/PUT /proposals/1.json
  def update
    authorize @proposal
    respond_to do |format|
      if @proposal.update(proposal_params)
        format.html { redirect_to proposal_path(@proposal) }
        format.json { render :show, status: :ok, location: @proposal }
      else
        format.html { render :edit }
        format.json do
          render json: @proposal.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /proposals/1
  # DELETE /proposals/1.json
  def destroy
    authorize @proposal
    @proposal.destroy
    redirect_to(proposals_path)
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  rescue StandardError
    redirect_to(proposals_path)
  end

  def proposal_params
    params.require(:proposal).permit(
      :title,
      :description,
      votes_attributes: [:id, :user_id, :_destroy]
    )
  end
end
