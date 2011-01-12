InvoicerRails::Application.routes.draw do
  resources :users do as_routes
    resources :pauses do as_routes end
    resources :service_invoice_items do as_routes end
    resources :invoices do as_routes end
    resources :customers do as_routes end
    resources :invoicing_parties do as_routes end
  end
  root :to => "user_sessions#new"
  resource :user_session
end
