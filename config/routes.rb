InvoicerRails::Application.routes.draw do
  resources :users do
    resources :pauses
    resources :service_invoice_items
    resources :invoices
    resources :customers
    resources :invoicing_parties
  end
  root :to => "user_sessions#new"
  resource :user_session
end
