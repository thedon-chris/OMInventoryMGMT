class SurgeryRecipeReqsController < ApplicationController
  before_action :set_surgery_recipe_req, only: [:show, :edit, :update, :destroy]

  # GET /surgery_recipe_reqs
  # GET /surgery_recipe_reqs.json
  def index
    @surgery_recipe_reqs = SurgeryRecipeReq.all
  end

  # GET /surgery_recipe_reqs/1
  # GET /surgery_recipe_reqs/1.json
  def show
  end

  # GET /surgery_recipe_reqs/new
  def new
    @surgery_recipe_req = SurgeryRecipeReq.new
  end

  # GET /surgery_recipe_reqs/1/edit
  def edit
  end

  # POST /surgery_recipe_reqs
  # POST /surgery_recipe_reqs.json
  def create
    @surgery_recipe_req = SurgeryRecipeReq.new(surgery_recipe_req_params)

    respond_to do |format|
      if @surgery_recipe_req.save
        format.html { redirect_to @surgery_recipe_req, notice: 'Surgery recipe req was successfully created.' }
        format.json { render :show, status: :created, location: @surgery_recipe_req }
      else
        format.html { render :new }
        format.json { render json: @surgery_recipe_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surgery_recipe_reqs/1
  # PATCH/PUT /surgery_recipe_reqs/1.json
  def update
    respond_to do |format|
      if @surgery_recipe_req.update(surgery_recipe_req_params)
        format.html { redirect_to @surgery_recipe_req, notice: 'Surgery recipe req was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @surgery_recipe_req }
      else
        format.html { render :edit }
        format.json { render json: @surgery_recipe_req.errors, status: :unprocessable_entity }
      end
    end

  end
  # DELETE /surgery_recipe_reqs/1
  # DELETE /surgery_recipe_reqs/1.json
  def destroy
    @surgery_recipe_req.destroy
    respond_to do |format|
      format.html { redirect_to surgery_recipe_reqs_url, notice: 'Surgery recipe req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surgery_recipe_req
      @surgery_recipe_req = SurgeryRecipeReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surgery_recipe_req_params
      params.require(:surgery_recipe_req).permit(:qty, :supply_list_id, :surgery_type_id)
    end
end
