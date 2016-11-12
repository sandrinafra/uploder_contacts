require 'test_helper'

class ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @import = imports(:one)
  end

  test "should get index" do
    get imports_url
    assert_response :success
  end

  test "should create import" do
    assert_difference('Import.count') do
      post imports_url, params: { import: { file: File.open(Rails.root.join('test/docs/test1.xlsx')) } }
    end
    assert_redirected_to import_url(Import.last)
  end

  test "should show import" do
    get import_url(@import)
    assert_response :success
  end

  test "should destroy import" do
    assert_difference('Import.count', -1) do
      delete import_url(@import)
    end

    assert_redirected_to imports_url
  end

end
