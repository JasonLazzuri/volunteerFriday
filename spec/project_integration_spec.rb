require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the add a new project page',{:type => :feature})do
  it('will let you add a new project to the projects list')do
    visit("/")
    click_link("Add New Project")
    fill_in("description", :with => "build a house")
    click_button("Add Project")
    expect(page).to have_content("Success!")
  end

  describe("editing a project name", {:type => :feature})do
    it("lets you edit a project name")do
      visit("/")
      click_link("Add New Project")
      fill_in("description", :with => "build a house")
      click_button("Add Project")
      click_link("See the list of Projects")
      click_link('build a house')
      click_link("Edit Projects Description")
      fill_in("description", :with => "build a boat")
      click_button('Update')
      expect(page).to have_content("build a boat")
    end
  end

end
