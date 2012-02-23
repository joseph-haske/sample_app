require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'", :chapter5=>"true" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'", :chapter5=>"true" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have a About page at '/about'", :chapter5=>"true" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Help page at '/help'", :chapter5=>"true" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a signup page at '/signup'", :chapter5 => "true" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end

  it "should have the right links in the layout", :chapter5 => "true" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact")
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Sign up now!"
    response.should have_selector('title', :content => "Sign up")
  end
end
