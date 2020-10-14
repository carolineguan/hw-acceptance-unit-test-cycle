Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match 'movies/:id/samedirector' => 'movies#samedirector', :via => :get, :as => 'samedirector_movie'
end
