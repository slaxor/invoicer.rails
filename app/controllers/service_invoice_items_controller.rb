class ServiceInvoiceItemsController < ApplicationController
  # GET /service_invoice_items
  # GET /service_invoice_items.xml
  def index
    @service_invoice_items = ServiceInvoiceItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_invoice_items }
    end
  end

  # GET /service_invoice_items/1
  # GET /service_invoice_items/1.xml
  def show
    @service_invoice_item = ServiceInvoiceItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_invoice_item }
    end
  end

  # GET /service_invoice_items/new
  # GET /service_invoice_items/new.xml
  def new
    @service_invoice_item = ServiceInvoiceItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_invoice_item }
    end
  end

  # GET /service_invoice_items/1/edit
  def edit
    @service_invoice_item = ServiceInvoiceItem.find(params[:id])
  end

  # POST /service_invoice_items
  # POST /service_invoice_items.xml
  def create
    @service_invoice_item = ServiceInvoiceItem.new(params[:service_invoice_item])

    respond_to do |format|
      if @service_invoice_item.save
        format.html { redirect_to(@service_invoice_item, :notice => 'Invoice item service was successfully created.') }
        format.xml  { render :xml => @service_invoice_item, :status => :created, :location => @service_invoice_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_invoice_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_invoice_items/1
  # PUT /service_invoice_items/1.xml
  def update
    @service_invoice_item = ServiceInvoiceItem.find(params[:id])

    respond_to do |format|
      if @service_invoice_item.update_attributes(params[:service_invoice_item])
        format.html { redirect_to(@service_invoice_item, :notice => 'Invoice item service was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_invoice_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_invoice_items/1
  # DELETE /service_invoice_items/1.xml
  def destroy
    @service_invoice_item = ServiceInvoiceItem.find(params[:id])
    @service_invoice_item.destroy

    respond_to do |format|
      format.html { redirect_to(service_invoice_items_url) }
      format.xml  { head :ok }
    end
  end
end
