Rails.application.routes.draw do
  get '/', to: "scores#index"
  get '/save_score/:name/:score', to: "scores#save_score"

  get '/players', to: "players#index"
  get '/save_player/:attacked/:countdown', to: "players#save_player"
end
