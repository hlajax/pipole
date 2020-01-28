require "application_system_test_case"

class RubriquesTest < ApplicationSystemTestCase
  setup do
    @rubrique = rubriques(:one)
  end

  test "visiting the index" do
    visit rubriques_url
    assert_selector "h1", text: "Rubriques"
  end

  test "creating a Rubrique" do
    visit rubriques_url
    click_on "New Rubrique"

    fill_in "Description", with: @rubrique.description
    fill_in "Titre", with: @rubrique.titre
    click_on "Create Rubrique"

    assert_text "Rubrique was successfully created"
    click_on "Back"
  end

  test "updating a Rubrique" do
    visit rubriques_url
    click_on "Edit", match: :first

    fill_in "Description", with: @rubrique.description
    fill_in "Titre", with: @rubrique.titre
    click_on "Update Rubrique"

    assert_text "Rubrique was successfully updated"
    click_on "Back"
  end

  test "destroying a Rubrique" do
    visit rubriques_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rubrique was successfully destroyed"
  end
end
