class IncomeAndExpenseItemsController < ApplicationController
  before_action :set_income_and_expense_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /income_and_expense_items
  # GET /income_and_expense_items.json
  def index
    @income_and_expense_items = current_user.income_and_expense_items.all
  end

  # GET /income_and_expense_items/1
  # GET /income_and_expense_items/1.json
  def show
  end

  # GET /income_and_expense_items/new
  def new
    @income_and_expense_item = current_user.income_and_expense_items.build
  end

  # GET /income_and_expense_items/1/edit
  def edit
  end

  # POST /income_and_expense_items
  # POST /income_and_expense_items.json
  def create
    @income_and_expense_item =  current_user.income_and_expense_items.build(income_and_expense_item_params)

    respond_to do |format|
      if @income_and_expense_item.save
        format.html { redirect_to @income_and_expense_item, notice: 'Income and expense item was successfully created.' }
        format.json { render :show, status: :created, location: @income_and_expense_item }
      else
        format.html { render :new }
        format.json { render json: @income_and_expense_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /income_and_expense_items/1
  # PATCH/PUT /income_and_expense_items/1.json
  def update
    respond_to do |format|
      if @income_and_expense_item.update(income_and_expense_item_params)
        format.html { redirect_to @income_and_expense_item, notice: 'Income and expense item was successfully updated.' }
        format.json { render :show, status: :ok, location: @income_and_expense_item }
      else
        format.html { render :edit }
        format.json { render json: @income_and_expense_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /income_and_expense_items/1
  # DELETE /income_and_expense_items/1.json
  def destroy
    @income_and_expense_item.destroy
    respond_to do |format|
      format.html { redirect_to income_and_expense_items_url, notice: 'Income and expense item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_income_and_expense_item
      @income_and_expense_item = current_user.income_and_expense_items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def income_and_expense_item_params
      params.require(:income_and_expense_item).permit(:title)
    end
end
