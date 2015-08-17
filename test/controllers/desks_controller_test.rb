require 'test_helper'

class DesksControllerTest < ActionController::TestCase
  setup do
    @desk = desks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:desks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create desk" do
    assert_difference('Desk.count') do
      post :create, desk: { description: @desk.description, image: @desk.image, name: @desk.name, price: @desk.price, space_id: @desk.space_id, user_id: @desk.user_id }
    end

    assert_redirected_to desk_path(assigns(:desk))
  end

  test "should show desk" do
    get :show, id: @desk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @desk
    assert_response :success
  end

  test "should update desk" do
    patch :update, id: @desk, desk: { description: @desk.description, image: @desk.image, name: @desk.name, price: @desk.price, space_id: @desk.space_id, user_id: @desk.user_id }
    assert_redirected_to desk_path(assigns(:desk))
  end

  test "should destroy desk" do
    assert_difference('Desk.count', -1) do
      delete :destroy, id: @desk
    end

    assert_redirected_to desks_path
  end
end
