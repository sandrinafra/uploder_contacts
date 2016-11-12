require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  test "should not create with same email" do
    contact = Contact.create(email: "dada@gr.com", firstname: 'lala', lastname: "lili")
    contact = Contact.new(email: "dada@gr.com", firstname: "tit", lastname: "tutu")
    assert_not contact.save
  end

  test "should not create with wrong email_format" do
    contact = Contact.new(email: "dada@gr.c")
    assert_not contact.save
    contact = Contact.new(email: "dada@g_.com")
    assert_not contact.save
    contact = Contact.new(email: "")
    assert_not contact.save
  end

end
