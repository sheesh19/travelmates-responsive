require "application_system_test_case"

class IndicesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/"

    assert_selector "h1", text: "Index"
  end
end
