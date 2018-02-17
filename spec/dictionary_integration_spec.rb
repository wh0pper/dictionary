require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add word to list', {:type => :feature}) do
  it('adds one word to page') do
    visit('/')
    fill_in('word', :with => 'integration')
    click_button('Add')
    expect(page).to have_content('integration')
  end

  it('adds multiple words to page') do
    visit('/')
    fill_in('word', :with => 'integration')
    click_button('Add')
    fill_in('word', :with => 'testing')
    click_button('Add')
    expect(page).to have_content('integration testing')
  end
end

describe('following added word as link to definition page', {:type => :feature}) do
  it('adds word to page, then goes to definition for that word') do
    visit('/')
    fill_in('word', :with => 'integration')
    click_button('Add')
    click_link('integration')
    expect(page).to have_content('Definition:')
  end

  it('adds custom definitions for word') do
    visit('/integration')
    fill_in('definition', :with => 'test add definition')
    click_button('Add')
    fill_in('definition', :with => 'testing a second custom definition')
    click_button('Add')
    expect(page).to have_content('test add definition')
    expect(page).to have_content('testing a second custom definition')
  end
end
