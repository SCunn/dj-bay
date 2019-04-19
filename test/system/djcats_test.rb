require "application_system_test_case"

class DjcatsTest < ApplicationSystemTestCase
  setup do
    @djcat = djcats(:one)
  end

  test "visiting the index" do
    visit djcats_url
    assert_selector "h1", text: "Djcats"
  end

  test "creating a Djcat" do
    visit djcats_url
    click_on "New Djcat"

    fill_in "Album", with: @djcat.album
    fill_in "Artist", with: @djcat.artist
    fill_in "Description", with: @djcat.description
    fill_in "Genre", with: @djcat.genre
    fill_in "Image", with: @djcat.image
    click_on "Create Djcat"

    assert_text "Djcat was successfully created"
    click_on "Back"
  end

  test "updating a Djcat" do
    visit djcats_url
    click_on "Edit", match: :first

    fill_in "Album", with: @djcat.album
    fill_in "Artist", with: @djcat.artist
    fill_in "Description", with: @djcat.description
    fill_in "Genre", with: @djcat.genre
    fill_in "Image", with: @djcat.image
    click_on "Update Djcat"

    assert_text "Djcat was successfully updated"
    click_on "Back"
  end

  test "destroying a Djcat" do
    visit djcats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Djcat was successfully destroyed"
  end
end
