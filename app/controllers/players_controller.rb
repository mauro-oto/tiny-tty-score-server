class PlayersController < ApplicationController
  def index
    attacked = Player.where(attacked: true).count
    not_attacked = Player.where(attacked: false).count

    render json: "#{attacked},#{not_attacked}"
  end

  def save_player
    if allow_request?
      Player.create(attacked: params[:attacked], countdown: params[:countdown])
      head :ok
    else
      head :unauthorized
    end
  end

  private

  def allow_request?
    request.user_agent.start_with?("DragonRuby") ||
      request.referer&.match?(/.*\.hwcdn\.net/)
  end
end
