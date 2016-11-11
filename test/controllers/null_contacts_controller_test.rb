require 'test_helper'

class NullContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @null_contact = null_contacts(:one)
  end

  test "should get index" do
    get null_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_null_contact_url
    assert_response :success
  end

  test "should create null_contact" do
    assert_difference('NullContact.count') do
      post null_contacts_url, params: { null_contact: { email: @null_contact.email, firstname: @null_contact.firstname, import_id: @null_contact.import_id, lastname: @null_contact.lastname, status: @null_contact.status } }
    end

    assert_redirected_to null_contact_url(NullContact.last)
  end

  test "should show null_contact" do
    get null_contact_url(@null_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_null_contact_url(@null_contact)
    assert_response :success
  end

  test "should update null_contact" do
    patch null_contact_url(@null_contact), params: { null_contact: { email: @null_contact.email, firstname: @null_contact.firstname, import_id: @null_contact.import_id, lastname: @null_contact.lastname, status: @null_contact.status } }
    assert_redirected_to null_contact_url(@null_contact)
  end

  test "should destroy null_contact" do
    assert_difference('NullContact.count', -1) do
      delete null_contact_url(@null_contact)
    end

    assert_redirected_to null_contacts_url
  end
end
