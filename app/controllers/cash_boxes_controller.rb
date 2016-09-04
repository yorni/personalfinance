class CashBoxesController < ApplicationController
  before_action :set_cash_box, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /cash_boxes
  # GET /cash_boxes.json
  def index  
    @cash_boxes = current_user.cash_boxes.all  
  end


  def search
    respond_to do |format|
      format.html
      format.json { @cash_boxes = current_user.cash_boxes.search(params[:term]) }
    end
  end


  # GET /cash_boxes/1
  # GET /cash_boxes/1.json
  def show
  end

  # GET /cash_boxes/new
  def new
    @cash_box = current_user.cash_boxes.build
  end

  # GET /cash_boxes/1/edit
  def edit
  end

  # POST /cash_boxes
  # POST /cash_boxes.json
  def create
    @cash_box = current_user.cash_boxes.build(cash_box_params)

    respond_to do |format|
      if @cash_box.save
        format.html { redirect_to @cash_box, notice: 'Cash box was successfully created.' }
        format.json { render :show, status: :created, location: @cash_box }
      else
        format.html { render :new }
        format.json { render json: @cash_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cash_boxes/1
  # PATCH/PUT /cash_boxes/1.json
  def update
    respond_to do |format|
      if @cash_box.update(cash_box_params)
        format.html { redirect_to @cash_box, notice: 'Cash box was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash_box }
      else
        format.html { render :edit }
        format.json { render json: @cash_box.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cash_boxes/1
  # DELETE /cash_boxes/1.json
  def destroy
    @cash_box.destroy
    respond_to do |format|
      format.html { redirect_to cash_boxes_url, notice: 'Cash box was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cash_box
      @cash_box = current_user.cash_boxes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cash_box_params
      params.require(:cash_box).permit(:title)
    end
end
