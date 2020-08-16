class ScoresController < ApplicationController
  def index
    scores = Score.select(:name, :score).order(score: :desc).limit(3)
    scores = scores.map { |score| "#{score.name}: #{score.score}" }.join("\n")

    render json: scores
  end

  def save_score
    Rails.logger.info "user agent: #{request.user_agent}"
    Rails.logger.info "request referral: #{request.referral}"
    if allow_request?
      Score.create(name: params[:name], score: params[:score])
      head :ok
    else
      head :unauthorized
    end
  end

  private

  def allow_request?
    request.user_agent.start_with?("DragonRuby") ||
      request.referral
  end
end
