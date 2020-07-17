class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :update, :destroy]

  def index
    @scores = Score.all.order("wins DESC")
    render json: ScoreSerializer.new(@scores).serializable_hash
  end

  def show
    render json: @score
  end

  def create
    @score = Score.new(score_params)

    if @score.save
      render json: @score, status: :created, location: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  def update
    if @score.update(score_params)
      render json: @score
    else
      render json: @score.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @score.destroy
  end

  private

  def set_score
    @score = Score.find(params[:id])
  end

  def score_params
    params.permit(:username, :wins, :losses, :draws)
  end
end
