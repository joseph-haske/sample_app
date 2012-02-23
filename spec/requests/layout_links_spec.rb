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
end
