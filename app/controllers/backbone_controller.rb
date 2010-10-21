class BackboneController < ApplicationController
  def index
    render :json => {:models => query_model}
  end

  def show
    render :json => {:model => current_user.customers.find(params[:customer_id]).contacts.find(params[:id])}
  end

  def create
    render :json => {:model => current_user.customers.find(params[:customer_id]).contacts << Contact.create(params[:model])}
  end

  def update
    render :json => {:model => current_user.customers.find(params[:customer_id]).contacts.update(params[:id], params[:model])}
  end

  def destroy
    render :json => {:model => current_user.customers.find(params[:customer_id]).contacts.destroy(params[:id])}
  end
  private
  def query_model(options = {})
    #it should at least implement the offered actions
    #eg like:
    #action = options[:action] || params[:action]
    #case options[:action]
    #  when 'index'
    #    @foos = Foo.all
    #  when 'show'
    #    @foo = Foo.find(params[:id])
    # ...
    raise 'PleaseImplementQueryModelMethod'
  end
end
