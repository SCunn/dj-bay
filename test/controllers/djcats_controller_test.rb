require 'test_helper'

class DjcatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @djcat = djcats(:one)
  end

  test "should get index" do
    get djcats_url
    assert_response :success
  end

  test "should get new" do
    get new_djcat_url
    assert_response :success
  end

  test "should create djcat" do
    assert_difference('Djcat.count') do
      post djcats_url, params: { djcat: { album: @djcat.album, artist: @djcat.artist, description: @djcat.description, genre: @djcat.genre, image: @djcat.image } }
    end

    assert_redirected_to djcat_url(Djcat.last)
  end

  test "should show djcat" do
    get djcat_url(@djcat)
    assert_response :success
  end

  test "should get edit" do
    get edit_djcat_url(@djcat)
    assert_response :success
  end

  test "should update djcat" do
    patch djcat_url(@djcat), params: { djcat: { album: @djcat.album, artist: @djcat.artist, description: @djcat.description, genre: @djcat.genre, image: @djcat.image } }
    assert_redirected_to djcat_url(@djcat)
  end

  test "should destroy djcat" do
    assert_difference('Djcat.count', -1) do
      delete djcat_url(@djcat)
    end

    assert_redirected_to djcats_url
  end
end
