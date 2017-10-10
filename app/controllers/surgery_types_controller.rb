class SurgeryTypesController < ApplicationController
  before_action :set_surgery_type, only: [:show, :edit, :update, :destroy]

  # GET /surgery_types
  # GET /surgery_types.json
  def index
    @surgery_types = SurgeryType.all
  end

  # GET /surgery_types/1
  # GET /surgery_types/1.json
  def show
  end

  # GET /surgery_types/new
  def new
    @surgery_type = SurgeryType.new
  end

  # GET /surgery_types/1/edit
  def edit
    @surgery_recipe_reqs = @surgery_type.surgery_recipe_reqs
  end

  # POST /surgery_types
  # POST /surgery_types.json
  def create
    @surgery_type = SurgeryType.new(surgery_type_params)

    respond_to do |format|
      if @surgery_type.save
        format.html { redirect_to @surgery_type, notice: 'Surgery type was successfully created.' }
        format.json { render :show, status: :created, location: @surgery_type }
      else
        format.html { render :new }
        format.json { render json: @surgery_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surgery_types/1
  # PATCH/PUT /surgery_types/1.json
  def update
    @surgery_type.surgery_recipe_reqs.each do |recip_req|
      update(qty: params["#{recip_req.name}"])
    end

    ### OLD UPDATE
    respond_to do |format|
      if @surgery_type.update(surgery_type_params)
        format.html { redirect_to @surgery_type, notice: 'Surgery type was successfully updated.' }
        format.json { render :show, status: :ok, location: @surgery_type }
      else
        format.html { render :edit }
        format.json { render json: @surgery_type.errors, status: :unprocessable_entity }
      end
    end
    ### OLD UPDATE
  end

  # DELETE /surgery_types/1
  # DELETE /surgery_types/1.json
  def destroy
    @surgery_type.destroy
    respond_to do |format|
      format.html { redirect_to surgery_types_url, notice: 'Surgery type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surgery_type
      @surgery_type = SurgeryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surgery_type_params
      params.require(:surgery_type).permit(:surgery_name)
    end
end
