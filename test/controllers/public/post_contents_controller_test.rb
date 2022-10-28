require 'test_helper'

class Public::PostContentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get public_post_contents_new_url
    assert_response :success
  end

  test 'should get show' do
    get public_post_contents_show_url
    assert_response :success
  end

  test 'should get index' do
    get public_post_contents_index_url
    assert_response :success
  end
end
