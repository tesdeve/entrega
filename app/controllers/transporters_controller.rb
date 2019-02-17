class TransportersController < ApplicationController
  before_action :set_transporter, only: [:show, :edit, :update, :destroy]
  before_action :set_company

  # GET /transporters
  # GET /transporters.json
  def index
    @transporters = @company.transporters
  end

  # GET /transporters/1
  # GET /transporters/1.json
  def show
  end

  # GET /transporters/new
  def new
    @transporter = Transporter.new({:company_id => @company.id})
  end

  # GET /transporters/1/edit
  def edit
  end

  # POST /transporters
  # POST /transporters.json
  def create
    @transporter = Transporter.new(transporter_params)

    respond_to do |format|
      if @transporter.save
        format.html { redirect_to company_transporter_path(@company, @transporter), notice: 'Transporter was successfully created.' }
        format.json { render :show, status: :created, location: @transporter }
      else
        format.html { render :new }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transporters/1
  # PATCH/PUT /transporters/1.json
  def update
    respond_to do |format|
      if @transporter.update(transporter_params)
        format.html { redirect_to company_transporter_path(@company, @transporter), notice: 'Transporter was successfully updated.' }
        format.json { render :show, status: :ok, location: @transporter }
      else
        format.html { render :edit }
        format.json { render json: @transporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transporters/1
  # DELETE /transporters/1.json
  def destroy
    @transporter.destroy
    respond_to do |format|
      format.html { redirect_to company_transporters_path(@company), notice: 'Transporter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporter
      @transporter = Transporter.find(params[:id])
    end

    def set_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transporter_params
      params.require(:transporter).permit(:name, :telephone, :email, :status, :company_id)
    end
end
