class InvoicingPartiesController < ApplicationController
  def index
    render :json => current_user.invoicing_parties
  end

  def show
    render :json => current_user.invoicing_parties.find(params[:id])
  end

  def create
    render :json => current_user.invoicing_parties << InvoicingParty.create(params[:invoicing_party])
  end

  def update
    render :json => current_user.invoicing_parties.update(params[:id], params[:invoicing_party])
  end

  def destroy
    render :json => current_user.invoicing_parties.destroy(params[:id])
  end
end
