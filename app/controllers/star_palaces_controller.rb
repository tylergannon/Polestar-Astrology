class StarPalacesController < ApplicationController
  # GET /star_palaces
  # GET /star_palaces.xml
  def index
    @star_palaces = StarPalace.all
    respond_with(@star_palaces)
  end

  # GET /star_palaces/1
  # GET /star_palaces/1.xml
  def show
    @star_palace = StarPalace.find(params[:id])
    respond_with(@star_palace)
  end

  # GET /star_palaces/new
  # GET /star_palaces/new.xml
  def new
    @star_palace = StarPalace.new
    respond_with(@star_palace)
  end

  # GET /star_palaces/1/edit
  def edit
    @star_palace = StarPalace.find(params[:id])
  end

  # POST /star_palaces
  # POST /star_palaces.xml
  def create
    @star_palace = StarPalace.new(params[:star_palace])
    flash[:notice] = 'StarPalace was successfully created.' if @star_palace.save
    respond_with(@star_palace)
  end

  # PUT /star_palaces/1
  # PUT /star_palaces/1.xml
  def update
    @star_palace = StarPalace.find(params[:id])
    flash[:notice] = 'StarPalace was successfully updated.' if @star_palace.update(params[:star_palace])
    respond_with(@star_palace)
  end

  # DELETE /star_palaces/1
  # DELETE /star_palaces/1.xml
  def destroy
    @star_palace = StarPalace.find(params[:id])
    @star_palace.destroy
    respond_with(@star_palace)
  end
end
