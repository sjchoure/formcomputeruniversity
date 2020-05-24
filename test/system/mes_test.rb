require "application_system_test_case"

class MesTest < ApplicationSystemTestCase
  setup do
    @me = mes(:one)
  end

  test "visiting the index" do
    visit mes_url
    assert_selector "h1", text: "Mes"
  end

  test "creating a Me" do
    visit mes_url
    click_on "New Me"

    fill_in "Email", with: @me.email
    fill_in "Name", with: @me.name
    click_on "Create Me"

    assert_text "Me was successfully created"
    click_on "Back"
  end

  test "updating a Me" do
    visit mes_url
    click_on "Edit", match: :first

    fill_in "Email", with: @me.email
    fill_in "Name", with: @me.name
    click_on "Update Me"

    assert_text "Me was successfully updated"
    click_on "Back"
  end

  test "destroying a Me" do
    visit mes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Me was successfully destroyed"
  end
end
