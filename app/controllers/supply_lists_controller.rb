class SupplyListsController < ApplicationController
  before_action :set_supply_list, only: [:show, :edit, :update, :destroy]

  # GET /supply_lists
  # GET /supply_lists.json
  def index
    @supply_lists = SupplyList.all
  end

  # GET /supply_lists/1
  # GET /supply_lists/1.json
  def show
  end

  # GET /supply_lists/new
  def new
    @supply_list = SupplyList.new
  end

  # GET /supply_lists/1/edit
  def edit
    
  end

  # POST /supply_lists
  # POST /supply_lists.json
  def create
    @supply_list = SupplyList.new(supply_list_params)

    respond_to do |format|
      if @supply_list.save
        format.html { redirect_to @supply_list, notice: 'Supply list was successfully created.' }
        format.json { render :show, status: :created, location: @supply_list }
      else
        format.html { render :new }
        format.json { render json: @supply_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supply_lists/1
  # PATCH/PUT /supply_lists/1.json
  def update
    respond_to do |format|
      if @supply_list.update(supply_list_params)
        format.html { redirect_to @supply_list, notice: 'Supply list was successfully updated.' }
        format.json { render :show, status: :ok, location: @supply_list }
      else
        format.html { render :edit }
        format.json { render json: @supply_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supply_lists/1
  # DELETE /supply_lists/1.json
  def destroy
    @supply_list.destroy
    respond_to do |format|
      format.html { redirect_to supply_lists_url, notice: 'Supply list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supply_list
      @supply_list = SupplyList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supply_list_params
      params.require(:supply_list).permit(:item_name)
    end
end
