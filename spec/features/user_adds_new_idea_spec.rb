require 'rails_helper'

describe "User adds a new idea" do
  scenario 'first idea', js: true do
    expect(Idea.count).to eq(0)

    visit '/'

    expect(page).to have_button('Save')

    expect_page_not_to_reload do
      fill_in 'idea-title', with: 'dat title'
      fill_in 'idea-body', with: 'fffffffffffffffffffffffff'
      click_on 'Save'

      within('div#all-ideas') do
        expect(page).to have_css('#idea-2')
        expect(page).to have_content('dat title')
        expect(page).to have_content('fffffffffffffffffffffffff')
      end

      expect(Idea.count).to eq(1)
      expect(page).to have_field('idea-title', with: '')
      expect(page).to have_field('idea-body', with: '')
    end

    expect_page_to_reload do
      page.reset!

      visit '/'

      within('div#all-ideas') do
        expect(page).to have_css('#idea-2')
        expect(page).to have_content('dat title')
        expect(page).to have_content('fffffffffffffffffffffffff')
      end
    end
  end

  def expect_page_to_reload
    page.evaluate_script "$(document.body).addClass('not-reloaded')"
    yield
    expect(page).not_to have_selector("body.not-reloaded")
  end

  def expect_page_not_to_reload
    page.evaluate_script "$(document.body).addClass('not-reloaded')"
    yield
    expect(page).to have_selector("body.not-reloaded")
  end
end
