# frozen_string_literal: true

require 'rails_helper'


RSpec.describe 'Group' do
  include Devise::Test::IntegrationHelpers
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  before(:example) do
    sign_in user
  end

  describe 'GET /groups/new' do
    it 'renders the new template' do
      visit new_group_path
      expect(page).to have_selector('form')
    end

    it 'displays the group form' do
      visit new_group_path
      expect(page).to have_current_path(new_group_path)
      expect(page).to have_selector('form')
      expect(page).to have_selector('input[type="text"][name="group[name]"]')
      expect(page).to have_selector('input[type="submit"]')
    end

    it 'creates a new group' do
      visit new_group_path
      fill_in 'group[name]', with: 'Test Group'
      attach_file('group[icon]', "#{Rails.root}/spec/resources/naruto.jpg")
      click_button 'Create Group'

      visit groups_path
      expect(Group.last.name).to eq('Test Group')
    end

    it 'displays errors if group creation fails' do
      visit new_group_path
      click_button 'Create Group'

      # expect(page).to render_template(:new)
      expect(page).to_not have_selector('div[style="color: green;"]')
    end
  end
end
