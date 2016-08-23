require 'test_helper'

class FacebookpostsControllerTest < ActionController::TestCase
  setup do
    @facebookpost = facebookposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebookposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebookpost" do
    assert_difference('Facebookpost.count') do
      post :create, facebookpost: { body: @facebookpost.body, user_id: @facebookpost.user_id }
    end

    assert_redirected_to facebookpost_path(assigns(:facebookpost))
  end

  test "should show facebookpost" do
    get :show, id: @facebookpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebookpost
    assert_response :success
  end

  test "should update facebookpost" do
    patch :update, id: @facebookpost, facebookpost: { body: @facebookpost.body, user_id: @facebookpost.user_id }
    assert_redirected_to facebookpost_path(assigns(:facebookpost))
  end

  test "should destroy facebookpost" do
    assert_difference('Facebookpost.count', -1) do
      delete :destroy, id: @facebookpost
    end

    assert_redirected_to facebookposts_path
  end
end
