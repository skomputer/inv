class ThingsController < ApplicationController
  # GET /things
  # GET /things.xml
  def index
    @things = Thing.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @things }
    end
  end

  # GET /things/1
  # GET /things/1.xml
  def show
    @thing = Thing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thing }
    end
  end

  # GET /things/new
  # GET /things/new.xml
  def new
    @thing = Thing.new
    @owner_ids = params[:owner_ids]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thing }
    end
  end

  # GET /things/1/edit
  def edit
    @thing = Thing.find(params[:id])
    @owner_ids = @thing.owner_ids
    @caretaker_ids = @thing.caretaker_ids
  end

  # POST /things
  # POST /things.xml
  def create
    @thing = Thing.new(params[:thing])

    if params[:owner_ids]
      if @owners = Account.find(params[:owner_ids])
        @thing.owners << @owners
        @owners.each do |owner|
          owner.owner_things << @thing
          owner.save
        end
      end
    end

    if params[:caretaker_ids]
      if @caretakers = Account.find(params[:caretaker_ids])
        @thing.caretakers << @caretakers
        @caretakers.each do |caretaker|
          caretaker.caretaker_things << @thing
          caretaker.save
        end
      end
    end

    params[:thing][:place_id] = place_id_from_form
    
    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to(@thing, :notice => 'Thing was successfully updated.') }
        format.xml  { render :xml => @thing, :status => :created, :location => @thing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /things/1
  # PUT /things/1.xml
  def update
    @thing = Thing.find(params[:id])
    params[:thing][:owner_ids] = params[:owner_ids]
    params[:thing][:caretaker_ids] = params[:caretaker_ids]

    params[:thing][:place_id] = place_id_from_form

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to(@thing, :notice => 'Thing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.xml
  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to(things_url) }
      format.xml  { head :ok }
    end
  end

  def search
    @q = params[:q]

    if !@q.empty?
      @things = Thing.fulltext_search(@q, :return_scores => true).collect{ |a| a[1] >= 1 ? a[0] : nil }.reject{ |a| a.nil? }
    else
      @things = Thing.all
    end
  end

  def place_id_from_form
    if !params[:place_id].empty?
      params[:place_id]
    elsif place_name = params[:place_name]
      @place = Place.new
      @place.name = place_name
      @place.description = params[:place_description]
      @place.save
      @place.id
    end
  end
end
