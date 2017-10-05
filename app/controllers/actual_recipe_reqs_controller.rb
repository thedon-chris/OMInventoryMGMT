class ActualRecipeReqsController < ApplicationController
  before_action :set_actual_recipe_req, only: [:show, :edit, :update, :destroy]

  # GET /actual_recipe_reqs
  # GET /actual_recipe_reqs.json
  def index
    @actual_recipe_reqs = ActualRecipeReq.all
  end

  # GET /actual_recipe_reqs/1
  # GET /actual_recipe_reqs/1.json
  def show
  end

  # GET /actual_recipe_reqs/new
  def new
    @actual_recipe_req = ActualRecipeReq.new
  end

  # GET /actual_recipe_reqs/1/edit
  def edit
  end

  # POST /actual_recipe_reqs
  # POST /actual_recipe_reqs.json
  def create
    @actual_recipe_req = ActualRecipeReq.new(actual_recipe_req_params)

    respond_to do |format|
      if @actual_recipe_req.save
        format.html { redirect_to @actual_recipe_req, notice: 'Actual recipe req was successfully created.' }
        format.json { render :show, status: :created, location: @actual_recipe_req }
      else
        format.html { render :new }
        format.json { render json: @actual_recipe_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /actual_recipe_reqs/1
  # PATCH/PUT /actual_recipe_reqs/1.json
  def update
    respond_to do |format|
      if @actual_recipe_req.update(actual_recipe_req_params)
        format.html { redirect_to @actual_recipe_req, notice: 'Actual recipe req was successfully updated.' }
        format.json { render :show, status: :ok, location: @actual_recipe_req }
      else
        format.html { render :edit }
        format.json { render json: @actual_recipe_req.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actual_recipe_reqs/1
  # DELETE /actual_recipe_reqs/1.json
  def destroy
    @actual_recipe_req.destroy
    respond_to do |format|
      format.html { redirect_to actual_recipe_reqs_url, notice: 'Actual recipe req was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actual_recipe_req
      @actual_recipe_req = ActualRecipeReq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def actual_recipe_req_params
      params.require(:actual_recipe_req).permit(:qty, :surgery_appt_id, :supply_list_id)
    end
end
