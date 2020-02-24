class HouseHoldsController < ApplicationController
  before_action :set_house_hold, only: [:show, :update, :destroy]

  # GET /house_holds
  def index
    @house_holds = HouseHold.all

    render json: @house_holds
  end

  # GET /house_holds/1
  def show
    render json: @house_hold
  end

  # POST /house_holds
  def create
    @house_hold = HouseHold.new(house_hold_params)

    if @house_hold.save
      render json: @house_hold, status: :created, location: @house_hold
    else
      render json: @house_hold.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /house_holds/1
  def update
    if @house_hold.update(house_hold_params)
      render json: @house_hold
    else
      render json: @house_hold.errors, status: :unprocessable_entity
    end
  end

  # DELETE /house_holds/1
  def destroy
    @house_hold.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_house_hold
      @house_hold = HouseHold.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def house_hold_params
      params.require(:house_hold).permit(:name, :member_id, :chore_id)
    end
end
