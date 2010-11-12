class BackboneController < ApplicationController
  def index
    render :json => {:models => query_model}
  end

  def show
    render :json => {:model => query_model}
  end

  def create
    params[:model] = JSON.parse(params[:model]) if params[:model]
    render :json => {:model => query_model}
  end

  def update
    params[:model] = JSON.parse(params[:model]) if params[:model]
    render :json => {:model => query_model}
  end

  def destroy
    render :json => {:model => query_model}
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
