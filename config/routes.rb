Rails.application.routes.draw do
  namespace 'api' do
    resources :ideas, only: %i[index create]
  end
end
