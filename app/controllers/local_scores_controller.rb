class LocalScoresController < ApplicationController
  before_action :set_local_score, only: [:show, :update, :destroy]

  def index
    @local_scores = LocalScore.all.order("wins DESC")
    render json: LocalScoreSerializer.new(@local_scores).serializable_hash
  end

  def show
    render json: LocalScoreSerializer.new(@local_score).serializable_hash
  end

  def create
    @local_score = LocalScore.new(local_score_params)

    if @local_score.save
      render json: LocalScoreSerializer.new(@local_score).serializable_hash, status: :created, location: @local_score
    else
      render json: LocalScoreSerializer.new(@local_score.errors).serializable_hash, status: :unprocessable_entity
    end
  end

  def update
    if @local_score.update(local_score_params)
      render json: LocalScoreSerializer.new(@local_score).serializable_hash
    else
      render json: LocalScoreSerializer.new(@local_score.errors).serializable_hash, status: :unprocessable_entity
    end
  end

  def destroy
    @local_score.destroy
  end

  private
    def set_local_score
      @local_score = LocalScore.find(params[:id])
    end

    def local_score_params
      params.fetch(:local_score, {})
    end
end
