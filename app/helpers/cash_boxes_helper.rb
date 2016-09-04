module CashBoxesHelper

  def new_or_edit_cash_box_path(cash_box)
    cash_box ? edit_cash_box_path(cash_box) : new_cash_box_path(cash_box)
  end

end
