Rails.application.routes.draw do
  get '/', to: "scores#index"
  get '/save_score/:name/:score', to: "scores#save_score"
end
