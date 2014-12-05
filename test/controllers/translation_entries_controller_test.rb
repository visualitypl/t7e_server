require 'test_helper'

class TranslationEntriesControllerTest < ActionController::TestCase
  setup do
    @translation_entry = translation_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:translation_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create translation_entry" do
    assert_difference('TranslationEntry.count') do
      post :create, translation_entry: { key: @translation_entry.key, parent_entry_id: @translation_entry.parent_entry_id, path: @translation_entry.path, project_id: @translation_entry.project_id, key_type: @translation_entry.type }
    end

    assert_redirected_to translation_entry_path(assigns(:translation_entry))
  end

  test "should show translation_entry" do
    get :show, id: @translation_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @translation_entry
    assert_response :success
  end

  test "should update translation_entry" do
    patch :update, id: @translation_entry, translation_entry: { key: @translation_entry.key, parent_entry_id: @translation_entry.parent_entry_id, path: @translation_entry.path, project_id: @translation_entry.project_id, key_type: @translation_entry.type }
    assert_redirected_to translation_entry_path(assigns(:translation_entry))
  end

  test "should destroy translation_entry" do
    assert_difference('TranslationEntry.count', -1) do
      delete :destroy, id: @translation_entry
    end

    assert_redirected_to translation_entries_path
  end
end
