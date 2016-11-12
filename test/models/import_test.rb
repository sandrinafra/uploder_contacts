require 'test_helper'

class ImportTest < ActiveSupport::TestCase

  test "should not save import without file" do
    import = Import.new
    assert_not import.save
  end
end
