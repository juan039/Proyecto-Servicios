class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :require_service]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :contracts, :require_service] 

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @users= User.all
  end

  # GET /services/1
  # GET /services/1.json
  def show

  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def require_service
    @contract=Contract.new
    render :require_service
  end

  def add_service  
    client= params[current_user]
    service= params[@service]
    client.contracts.create({client_id: client.id, service_id: service.id})
  end

  def contracts
    @user=current_user
    if @user.provider == true
      render :dashboard
    else 
      render :my_contracts
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name)
    end

end
