require "application_system_test_case"

class BabblesTest < ApplicationSystemTestCase
  setup do
    @babble = babbles(:one)
  end

  test "visiting the index" do
    visit babbles_url
    assert_selector "h1", text: "Babbles"
  end

  test "creating a Babble" do
    visit babbles_url
    click_on "New Babble"

    fill_in "Content", with: @babble.content
    fill_in "Expires at", with: @babble.expires_at
    fill_in "User", with: @babble.user_id
    click_on "Create Babble"

    assert_text "Babble was successfully created"
    click_on "Back"
  end

  test "updating a Babble" do
    visit babbles_url
    click_on "Edit", match: :first

    fill_in "Content", with: @babble.content
    fill_in "Expires at", with: @babble.expires_at
    fill_in "User", with: @babble.user_id
    click_on "Update Babble"

    assert_text "Babble was successfully updated"
    click_on "Back"
  end

  test "destroying a Babble" do
    visit babbles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Babble was successfully destroyed"
  end
end
