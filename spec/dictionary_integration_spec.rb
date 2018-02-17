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
end
