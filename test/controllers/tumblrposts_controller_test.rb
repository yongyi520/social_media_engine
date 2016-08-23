require 'test_helper'

class TumblrpostsControllerTest < ActionController::TestCase
  setup do
    @tumblrpost = tumblrposts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tumblrposts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tumblrpost" do
    assert_difference('Tumblrpost.count') do
      post :create, tumblrpost: { body: @tumblrpost.body, title: @tumblrpost.title, user_id: @tumblrpost.user_id }
    end

    assert_redirected_to tumblrpost_path(assigns(:tumblrpost))
  end

  test "should show tumblrpost" do
    get :show, id: @tumblrpost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tumblrpost
    assert_response :success
  end

  test "should update tumblrpost" do
    patch :update, id: @tumblrpost, tumblrpost: { body: @tumblrpost.body, title: @tumblrpost.title, user_id: @tumblrpost.user_id }
    assert_redirected_to tumblrpost_path(assigns(:tumblrpost))
  end

  test "should destroy tumblrpost" do
    assert_difference('Tumblrpost.count', -1) do
      delete :destroy, id: @tumblrpost
    end

    assert_redirected_to tumblrposts_path
  end
end
