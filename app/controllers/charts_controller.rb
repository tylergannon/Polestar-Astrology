class ChartsController < ApplicationController
  # GET /charts
  # GET /charts.xml
  def index
    @charts = Chart.all
    respond_with(@charts)
  end

  # GET /charts/1
  # GET /charts/1.xml
  
  
  def show
    unless parent.chart
      parent.update_attributes chart: Chart.find_or_create(parent.dob)
    end
    @chart = parent.chart
    @name  = parent.full_name

    @chart = Chart.find(params[:id])
    respond_with(@chart)
    
    respond_to do |format|
      format.html
      # format.html { render :layout => 'chart' }
      format.pdf {
        pdf = ChartPdf.new(@chart, @name, view_context)
        send_data pdf.render, filename: "#{parent.friendly_id}-natal-chart.pdf", type: "application/pdf", disposition: 'inline'
      }
    end
  end

  # GET /charts/new
  # GET /charts/new.xml
  def new
    @chart = Chart.new
    respond_with(@chart)
  end

  # GET /charts/1/edit
  def edit
    @chart = Chart.find(params[:id])
  end

  # POST /charts
  # POST /charts.xml
  def create
    @chart = Chart.new(params[:chart])
    flash[:notice] = 'Chart was successfully created.' if @chart.save
    respond_with(@chart)
  end

  # PUT /charts/1
  # PUT /charts/1.xml
  def update
    @chart = Chart.find(params[:id])
    flash[:notice] = 'Chart was successfully updated.' if @chart.update(params[:chart])
    respond_with(@chart)
  end

  # DELETE /charts/1
  # DELETE /charts/1.xml
  def destroy
    @chart = Chart.find(params[:id])
    @chart.destroy
    respond_with(@chart)
  end
end
