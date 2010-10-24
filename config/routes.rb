InvoicerRails::Application.routes.draw do |map|
  root :to => "user_sessions#new"
  resource :user_session

  resources :users , :constraints => {:id => /\d+/}do
    resources :invoicing_parties, :constraints => {:user_id => /\d+/, :id => /\d+/}
    resources :customers, :constraints => {:user_id => /\d+/, :id => /\d+/} do
      resources :invoices, :constraints => {:user_id => /\d+/, :customer_id => /\d+/, :id => /\d+/} do
        member do
          get :print
        end
        resources :service_invoice_items, :constraints => {:user_id => /\d+/, :customer_id => /\d+/, :invoice_id => /\d+/, :id => /\d+/} do
          resources :pauses, :constraints => {:user_id => /\d+/, :customer_id => /\d+/, :invoice_id => /\d+/,:service_invoice_item_id => /\d+/, :id => /\d+/}
        end
      end
    end
  end
end
