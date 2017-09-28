require 'test_helper'

class CustomizationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customization = customizations(:one)
  end

  test "should get index" do
    get customizations_url
    assert_response :success
  end

  test "should get new" do
    get new_customization_url
    assert_response :success
  end

  test "should create customization" do
    assert_difference('Customization.count') do
      post customizations_url, params: { customization: { color_background: @customization.color_background, color_border: @customization.color_border, color_highlight: @customization.color_highlight, color_hover: @customization.color_hover, color_text: @customization.color_text, text_apt_suite: @customization.text_apt_suite, text_inaccurate: @customization.text_inaccurate, text_select_confirm: @customization.text_select_confirm, text_select_suggestion: @customization.text_select_suggestion, text_suggest1: @customization.text_suggest1, text_suggest2: @customization.text_suggest2 } }
    end

    assert_redirected_to customization_url(Customization.last)
  end

  test "should show customization" do
    get customization_url(@customization)
    assert_response :success
  end

  test "should get edit" do
    get edit_customization_url(@customization)
    assert_response :success
  end

  test "should update customization" do
    patch customization_url(@customization), params: { customization: { color_background: @customization.color_background, color_border: @customization.color_border, color_highlight: @customization.color_highlight, color_hover: @customization.color_hover, color_text: @customization.color_text, text_apt_suite: @customization.text_apt_suite, text_inaccurate: @customization.text_inaccurate, text_select_confirm: @customization.text_select_confirm, text_select_suggestion: @customization.text_select_suggestion, text_suggest1: @customization.text_suggest1, text_suggest2: @customization.text_suggest2 } }
    assert_redirected_to customization_url(@customization)
  end

  test "should destroy customization" do
    assert_difference('Customization.count', -1) do
      delete customization_url(@customization)
    end

    assert_redirected_to customizations_url
  end
end
