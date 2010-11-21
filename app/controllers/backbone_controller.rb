class BackboneController < ApplicationController
  def index
    render :json => query_model
  end

  def show
    render :json => query_model
  end

  def create
    params[:model] = JSON.parse(params[:model]) if params[:model]
    render :json => query_model
  end

  def update
    params[:model] = JSON.parse(params[:model]) if params[:model]
    render :json => query_model
  end

  def destroy
    render :json => query_model
  end
  private
  def query_model(options = {})
    action = options[:action] || params.delete(:action)
    attributes =  params.select { |k,v| model.column_names.include?(k) } #TODO backbone should properly namespace the attributes
    case action
    when 'index'
      collection
    when 'show'
      collection.find(params[:id])
    when 'create'
      (collection << model.create!(params)).last
    when 'update'
      collection.find(params[:id]).update_attributes!(attributes)
    when 'destroy'
      collection.destroy!(params[:id])
    end
  end
end
