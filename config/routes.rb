Rails.application.routes.draw do
  resources :orders
  resources :order_histories
  resources :medicine_stocks
  resources :charges
  resources :medical_stores, except:[:show]
  get '/medical_stores/stock'
  resources :select_months
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "users/sessions#new"
  end 
  # namespace :hospitals do
  #   get 'login'
  #   post 'create'
  # end
  # resources :pathology_labs

  namespace :medical_stores do
    get 'login'
    post 'create'
    get 'search'
    get 'sendmail'
  end
 

  resources :patients, except:[:show] do
    get 'message', on: :member, action: :message_send
    post 'message_send', on: :member, action: :message_create
    get 'message_request', on: :member, action: :message_requst
    get 'prescription', on: :member, action: :prescription
    get 'appoiment', on: :member, action: :appoiment
    post 'appoiment_send', on: :member, action: :appoiment_send
    get 'store', on: :member, action: :medical_store
    post 'order', on: :member, action: :place_order
  end


  resources :doctors, except:[:show] do
    get 'login', on: :collection
    get 'create', on: :collection
    get 'index_page', on: :collection
    get 'requests', on: :collection
    get 'request_accept', on: :member, action: :request_accept
    get 'request_reject', on: :member, action: :request_reject
    get 'my_patients', on: :collection
    get 'appoiments', on: :collection
    get 'my_profile', on: :collection
    get 'availability_form', on: :collection
    post 'availability_post', on: :member
    get 'prescription_form', on: :member 
    get 'open_chat', on: :member
    post 'post_prescription', on: :member
    patch 'post_prescription', on: :member 
    post 'send_message', on: :member
    get 'medical_history', on: :member
  end
    
  namespace :pathology_labs do
    get 'login'
    post 'create'
  end

  devise_for :users, :controllers => {registrations: 'users/registrations'} 

end
