require 'rails_helper'

describe "visitor visits login page" do
    it "visitor can see log in" do
      visit root_path

      expect(page).to have_link("Login")
    end
    
    it "visitor does not see logout" do 
      visit root_path
      
      expect(page).to_not have_content("Logout")
  end
end