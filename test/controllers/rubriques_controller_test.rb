require 'test_helper'

class RubriquesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rubrique = rubriques(:one)
  end

  test "should get index" do
    get rubriques_url
    assert_response :success
  end

  test "should get new" do
    get new_rubrique_url
    assert_response :success
  end

  test "should create rubrique" do
    assert_difference('Rubrique.count') do
      post rubriques_url, params: { rubrique: { description: @rubrique.description, titre: @rubrique.titre } }
    end

    assert_redirected_to rubrique_url(Rubrique.last)
  end

  test "should show rubrique" do
    get rubrique_url(@rubrique)
    assert_response :success
  end

  test "should get edit" do
    get edit_rubrique_url(@rubrique)
    assert_response :success
  end

  test "should update rubrique" do
    patch rubrique_url(@rubrique), params: { rubrique: { description: @rubrique.description, titre: @rubrique.titre } }
    assert_redirected_to rubrique_url(@rubrique)
  end

  test "should destroy rubrique" do
    assert_difference('Rubrique.count', -1) do
      delete rubrique_url(@rubrique)
    end

    assert_redirected_to rubriques_url
  end
end
