class NoParkingZonesController < ApplicationController
  before_action :set_no_parking_zone, only: [:show, :edit, :update, :destroy]

  # GET /no_parking_zones
  # GET /no_parking_zones.json
  def load_zones
     @no_parking_zone_default = Gmaps4rails.build_markers(NoParkingZone.all) do |plot, marker|
        marker.lat plot.latitude
        marker.lng plot.longitude

        @status = rand(1..4)
        @ip = "192.168."+rand(0..255).to_s+"."+rand(15..250).to_s
        @connected = rand(50..100)

        if plot.reason == "Police"
          url_alert = "/assets/police.png"
        elsif plot.reason == "Street Cleaning"
            url_alert = "/assets/cleaning.png"
        elsif plot.reason == "Festival / Parade"
            url_alert = "/assets/party.png"
        end

        marker.picture({
          "url" => url_alert,
          "width" => 35,
          "height" => 30
        })

        marker.infowindow render_to_string(:partial => "/no_parking_zones/info",
          :locals => {:street => plot.street, :reason => plot.reason, :date => plot.date, :ip => @ip, :connected => @connected })
     end
   end

  def index
     load_zones

     @no_parking_zone = NoParkingZone.all
  end

  # GET /no_parking_zones/1
  # GET /no_parking_zones/1.json
  def show
  end

  # GET /no_parking_zones/new
  def new
    @no_parking_zone = NoParkingZone.new
  end

  # GET /no_parking_zones/1/edit
  def edit
  end

  # POST /no_parking_zones
  # POST /no_parking_zones.json
  def create
    @no_parking_zone = NoParkingZone.new(no_parking_zone_params)

    respond_to do |format|
      if @no_parking_zone.save
        format.html { redirect_to @no_parking_zone, notice: 'No parking zone was successfully created.' }
        format.json { render :show, status: :created, location: @no_parking_zone }
      else
        format.html { render :new }
        format.json { render json: @no_parking_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /no_parking_zones/1
  # PATCH/PUT /no_parking_zones/1.json
  def update
    respond_to do |format|
      if @no_parking_zone.update(no_parking_zone_params)
        format.html { redirect_to @no_parking_zone, notice: 'No parking zone was successfully updated.' }
        format.json { render :show, status: :ok, location: @no_parking_zone }
      else
        format.html { render :edit }
        format.json { render json: @no_parking_zone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /no_parking_zones/1
  # DELETE /no_parking_zones/1.json
  def destroy
    @no_parking_zone.destroy
    respond_to do |format|
      format.html { redirect_to no_parking_zones_url, notice: 'No parking zone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_no_parking_zone
      @no_parking_zone = NoParkingZone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def no_parking_zone_params
      params.require(:no_parking_zone).permit(:street, :reason, :date, :latitude, :longitude)
    end
end
