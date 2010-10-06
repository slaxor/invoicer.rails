class InvoicingPartiesController < ApplicationController
  # GET /invoicing_parties
  # GET /invoicing_parties.xml
  def index
    @invoicing_parties = InvoicingParty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @invoicing_parties }
    end
  end

  # GET /invoicing_parties/1
  # GET /invoicing_parties/1.xml
  def show
    @invoicing_party = InvoicingParty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @invoicing_party }
    end
  end

  # GET /invoicing_parties/new
  # GET /invoicing_parties/new.xml
  def new
    @invoicing_party = InvoicingParty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @invoicing_party }
    end
  end

  # GET /invoicing_parties/1/edit
  def edit
    @invoicing_party = InvoicingParty.find(params[:id])
  end

  # POST /invoicing_parties
  # POST /invoicing_parties.xml
  def create
    @invoicing_party = InvoicingParty.new(params[:invoicing_party])

    respond_to do |format|
      if @invoicing_party.save
        format.html { redirect_to(@invoicing_party, :notice => 'Invoicing party was successfully created.') }
        format.xml  { render :xml => @invoicing_party, :status => :created, :location => @invoicing_party }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @invoicing_party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /invoicing_parties/1
  # PUT /invoicing_parties/1.xml
  def update
    @invoicing_party = InvoicingParty.find(params[:id])

    respond_to do |format|
      if @invoicing_party.update_attributes(params[:invoicing_party])
        format.html { redirect_to(@invoicing_party, :notice => 'Invoicing party was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @invoicing_party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicing_parties/1
  # DELETE /invoicing_parties/1.xml
  def destroy
    @invoicing_party = InvoicingParty.find(params[:id])
    @invoicing_party.destroy

    respond_to do |format|
      format.html { redirect_to(invoicing_parties_url) }
      format.xml  { head :ok }
    end
  end
end
