require 'test_helper'

class OrgListsControllerTest < ActionController::TestCase
  setup do
    @org_list = org_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:org_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create org_list" do
    assert_difference('OrgList.count') do
      post :create, org_list: { desc: @org_list.desc, name: @org_list.name, tel: @org_list.tel }
    end

    assert_redirected_to org_list_path(assigns(:org_list))
  end

  test "should show org_list" do
    get :show, id: @org_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @org_list
    assert_response :success
  end

  test "should update org_list" do
    put :update, id: @org_list, org_list: { desc: @org_list.desc, name: @org_list.name, tel: @org_list.tel }
    assert_redirected_to org_list_path(assigns(:org_list))
  end

  test "should destroy org_list" do
    assert_difference('OrgList.count', -1) do
      delete :destroy, id: @org_list
    end

    assert_redirected_to org_lists_path
  end
end
