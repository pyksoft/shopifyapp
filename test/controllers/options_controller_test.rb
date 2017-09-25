require 'test_helper'

class OptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @option = options(:one)
  end

  test "should get index" do
    get options_url
    assert_response :success
  end

  test "should get new" do
    get new_option_url
    assert_response :success
  end

  test "should create option" do
    assert_difference('Option.count') do
      post options_url, params: { option: { auto_complete: @option.auto_complete, pobox_warning: @option.pobox_warning, streetnum_warning: @option.streetnum_warning, validate_address: @option.validate_address } }
    end

    assert_redirected_to option_url(Option.last)
  end

  test "should show option" do
    get option_url(@option)
    assert_response :success
  end

  test "should get edit" do
    get edit_option_url(@option)
    assert_response :success
  end

  test "should update option" do
    patch option_url(@option), params: { option: { auto_complete: @option.auto_complete, pobox_warning: @option.pobox_warning, streetnum_warning: @option.streetnum_warning, validate_address: @option.validate_address } }
    assert_redirected_to option_url(@option)
  end

  test "should destroy option" do
    assert_difference('Option.count', -1) do
      delete option_url(@option)
    end

    assert_redirected_to options_url
  end
end
