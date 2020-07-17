Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get("/hello_world", to: "welcome#hello_world")

 get "/", to: "welcome#root"

 get "/contact_us", to: "welcome#contact_us"

 post "/process_contact", to: "welcome#process_contact"
end
