class InvoiceItemServicesController < ApplicationController
  # GET /invoice_item_services
  # GET /invoice_item_services.xml
  def index
    @invoice_item_services = InvoiceItemService.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoice_item_services }
    end
  end

  # GET /invoice_item_services/1
  # GET /invoice_item_services/1.xml
  def show
    @invoice_item_service = InvoiceItemService.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoice_item_service }
    end
  end

  # GET /invoice_item_services/new
  # GET /invoice_item_services/new.xml
  def new
    @invoice_item_service = InvoiceItemService.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoice_item_service }
    end
  end

  # GET /invoice_item_services/1/edit
  def edit
    @invoice_item_service = InvoiceItemService.find(params[:id])
  end

  # POST /invoice_item_services
  # POST /invoice_item_services.xml
  def create
    @invoice_item_service = InvoiceItemService.new(params[:invoice_item_service])

    respond_to do |format|
      if @invoice_item_service.save
        format.html { redirect_to(@invoice_item_service, :notice => 'Invoice item service was successfully created.') }
        format.xml  { render :xml => @invoice_item_service, :status => :created, :location => @invoice_item_service }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoice_item_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoice_item_services/1
  # PUT /invoice_item_services/1.xml
  def update
    @invoice_item_service = InvoiceItemService.find(params[:id])

    respond_to do |format|
      if @invoice_item_service.update_attributes(params[:invoice_item_service])
        format.html { redirect_to(@invoice_item_service, :notice => 'Invoice item service was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoice_item_service.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_item_services/1
  # DELETE /invoice_item_services/1.xml
  def destroy
    @invoice_item_service = InvoiceItemService.find(params[:id])
    @invoice_item_service.destroy

    respond_to do |format|
      format.html { redirect_to(invoice_item_services_url) }
      format.xml  { head :ok }
    end
  end
end
