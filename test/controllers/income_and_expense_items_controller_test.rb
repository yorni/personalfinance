require 'test_helper'

class IncomeAndExpenseItemsControllerTest < ActionController::TestCase
  setup do
    @income_and_expense_item = income_and_expense_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:income_and_expense_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create income_and_expense_item" do
    assert_difference('IncomeAndExpenseItem.count') do
      post :create, income_and_expense_item: { title: @income_and_expense_item.title }
    end

    assert_redirected_to income_and_expense_item_path(assigns(:income_and_expense_item))
  end

  test "should show income_and_expense_item" do
    get :show, id: @income_and_expense_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @income_and_expense_item
    assert_response :success
  end

  test "should update income_and_expense_item" do
    patch :update, id: @income_and_expense_item, income_and_expense_item: { title: @income_and_expense_item.title }
    assert_redirected_to income_and_expense_item_path(assigns(:income_and_expense_item))
  end

  test "should destroy income_and_expense_item" do
    assert_difference('IncomeAndExpenseItem.count', -1) do
      delete :destroy, id: @income_and_expense_item
    end

    assert_redirected_to income_and_expense_items_path
  end
end
