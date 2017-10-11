class SurgeryApptsController < ApplicationController
  before_action :set_surgery_appt, only: [:show, :edit, :update, :destroy, :completed]

  # GET /surgery_appts
  # GET /surgery_appts.json
  def index
    @surgery_appts = SurgeryAppt.all
  end

  # GET /surgery_appts/1
  # GET /surgery_appts/1.json
  def show
  end

  # GET /surgery_appts/new
  def new
    @surgery_appt = SurgeryAppt.new

  end

  # GET /surgery_appts/1/edit
  def edit
    # @surgery_recipe_reqs = @surgery_appt.surgery_type.surgery_recipe_reqs.each do |x|
    #   x.supply_list.item_name
    # end
  end



  # POST /surgery_appts
  # POST /surgery_appts.json
  def create
    @surgery_appt = SurgeryAppt.new(surgery_appt_params)
      if @surgery_appt.save
        SurgeryType.find(@surgery_appt.surgery_type_id).surgery_recipe_reqs.each do |req|
          supply_item = req.supply_list_id
          ActualRecipeReq.create(
            qty:req.qty,
            supply_list_id:supply_item,
            surgery_appt_id:@surgery_appt.id)
          end
        else
          redirect_to root_path
      end
  end

  def completed
  end

  # PATCH/PUT /surgery_appts/1
  # PATCH/PUT /surgery_appts/1.json
  def update
    respond_to do |format|
      if @surgery_appt.update(surgery_appt_params)
        # format.html { redirect_to @surgery_appt, notice: 'Surgery appt was successfully updated.' }
        format.json { render :show, status: :ok, location: @surgery_appt }
        puts "********************************************"
        if params[:surgery_appt][:status] == true
          puts "#{params[:surgery_appt][:status]}"
          puts "parameters are true! wohooo"
          puts "********************************************"
        else
          puts "#{params[:surgery_appt][:status]}"
          puts "parameters are fahh! wohooo"
          puts "********************************************"
        end
      else
        format.html { render :edit }
        format.json { render json: @surgery_appt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surgery_appts/1
  # DELETE /surgery_appts/1.json
  def destroy
    @surgery_appt.destroy
    respond_to do |format|
      format.html { redirect_to surgery_appts_url, notice: 'Surgery appt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_surgery_appt
      @surgery_appt = SurgeryAppt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def surgery_appt_params
      params.require(:surgery_appt).permit(:surgery_date, :clinic_id, :surgery_type_id, :status)
    end
end



    # @surgery_appt = SurgeryAppt.new(surgery_appt_params)
    # respond_to do |format|
    #   if @surgery_appt.save
    #     format.html { redirect_to @surgery_appt, notice: 'Surgery appt was successfully created.' }
    #     format.json { render :show, status: :created, location: @surgery_appt }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @surgery_appt.errors, status: :unprocessable_entity }
    #   end
    # end
