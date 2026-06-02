require "application_system_test_case"

class InspectionsTest < ApplicationSystemTestCase
  setup do
    @inspection = inspections(:one)
  end

  test "visiting the index" do
    visit inspections_url
    assert_selector "h1", text: "Inspections"
  end

  test "should create inspection" do
    visit inspections_url
    click_on "New inspection"

    fill_in "Bee family", with: @inspection.bee_family_id
    fill_in "Brood frames", with: @inspection.brood_frames
    fill_in "Comment", with: @inspection.comment
    fill_in "Honey frames", with: @inspection.honey_frames
    fill_in "Inspected on", with: @inspection.inspected_on
    fill_in "Other info", with: @inspection.other_info
    fill_in "Total frames", with: @inspection.total_frames
    click_on "Create Inspection"

    assert_text "Inspection was successfully created"
    click_on "Back"
  end

  test "should update Inspection" do
    visit inspection_url(@inspection)
    click_on "Edit this inspection", match: :first

    fill_in "Bee family", with: @inspection.bee_family_id
    fill_in "Brood frames", with: @inspection.brood_frames
    fill_in "Comment", with: @inspection.comment
    fill_in "Honey frames", with: @inspection.honey_frames
    fill_in "Inspected on", with: @inspection.inspected_on
    fill_in "Other info", with: @inspection.other_info
    fill_in "Total frames", with: @inspection.total_frames
    click_on "Update Inspection"

    assert_text "Inspection was successfully updated"
    click_on "Back"
  end

  test "should destroy Inspection" do
    visit inspection_url(@inspection)
    click_on "Destroy this inspection", match: :first

    assert_text "Inspection was successfully destroyed"
  end
end
