ElusiveIndexInvite::Application.routes.draw do
  root :to => "home#index"

  devise_for  :users,
              :path => "invite",
              :controllers => { :registrations => "registrations",
                                :confirmations => "confirmations",
                                :sessions => "devise/sessions",
                              },
              :skip => [:sessions] do 
                get   "/login" => "devise/sessions#new", :as => :new_user_session
                post  "/login" => "devise/sessions#create", :as => :user_session
                get   "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
                get   "/register" => "registrations#new", :as => :new_user_registration
              end

  devise_scope :user do
    # Matches for Devise here.
  end
end
