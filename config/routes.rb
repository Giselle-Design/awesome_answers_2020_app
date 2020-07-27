Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get("/hello_world", to: "welcome#hello_world")

 get "/", to: "welcome#root", as: "root"

 # root "welcome#root"

 get "/contact_us", to: "welcome#contact_us"

 post "/process_contact", to: "welcome#process_contact"



 # get "/questions/new", {to: "questions#new", as: :new_questions}
 #
 # post "/questions", {to: "questions#create", as: :questions}
 #
 # get "/questions/:id", {to: "questions#show", as: :question}
 #
 # get "/questions", {to: "questions#index"}
 #
 # get "/questions/:id/edit", {to: "questions#edit", as: :edit_question}
 #
 # patch "/questions/:id", {to: "questions#update"}
 #
 # delete "/questions/:id", {to: "questions#destroy"}

 resources :questions do
   resources :answers, only: [:create, :destroy]
 end
    resources :users, only: [:new, :create]
    resource :session, only: [:new, :create, :destroy]
end


# get 'profile', to: 'users#show'
#
# get 'profile', action: :show, controller: 'users'
