class TransactionsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :get_transactions, only: [:reports]

def index
  @transactions = current_user.transactions.all.order(sort_column + " " + sort_direction).page(params[:page]).per(10)
end

  def show
  end

  def new
    @transaction =  current_user.transactions.build
  end

  def edit
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to root_path, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def reports
    if current_user.transactions.all.where('transactiontype = "Приход"').count > 0
      @income = current_user.transactions.select("sum(sum) as income").where('transactiontype = "Приход"').group(:transactiontype).first.income
    else
     @income = 0
   end
   
   if current_user.transactions.all.where('transactiontype = "Расход"').count > 0
    @expense = current_user.transactions.select("sum(sum) as expense").where('transactiontype = "Расход"').group(:transactiontype).first.expense
  else
   @expense = 0
 end

 
 @cash = @income - @expense

 @prihod_group = @transactions.where('transactiontype = "Приход"').group_by_day(:created_at, 'sum', 'sum')
 @rashod_group = @transactions.where('transactiontype = "Расход"').group_by_day(:created_at, 'sum', 'sum')


@ostatok_group = {}
ostatok_group1 = current_user.transactions.select('sum(CASE When transactiontype = "Приход" Then sum Else -sum end) as sum, cash_box_id').group(:cash_box_id).order('sum DESC')


ostatok_group1.each do |transact|
  @ostatok_group[transact.cash_box.title.to_sym] = transact.sum
end


end





  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_transaction
      @transaction = current_user.transactions.find(params[:id])
    end

    def transaction_params
      params.require(:transaction).permit(:sum, :transactiontype, :cash_box_id, :income_and_expense_item_id)
    end

    def get_transactions
      @transactions = current_user.transactions.all.order(sort_column + " " + sort_direction)
    end

    def sort_column
      Transaction.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
