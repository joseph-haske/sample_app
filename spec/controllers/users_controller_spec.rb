require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'show'" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful", :chapter7 => "true" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user", :chapter7 => "true" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title", :chapter7 => "true" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.name)
    end

    it "should include the user's name", :chapter7 => "true" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.name)
    end

    it "should have a profile image", :chapter7 => "true" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end

  describe "GET 'new'" do
    it "should be successful", :chapter5 => "true" do
      get 'new'
      response.should be_success
    end

    it "should have the right title", :chapter5 => "true" do
      get 'new'
      response.should have_selector("title", :content => "Sign up")
    end
  end
  
  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
        @attr = { :name => "", :email => "", :password => "", :password_confirmation => "" }
      end

      it "should not create a user", :chapter8 => "true" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title", :chapter8 => "true" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end

      it "should render the 'new' page", :chapter8 => "true" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end
    
  describe "success" do
    before(:each) do
      @attr = { :name => "New User", :email => "user@example.com", :password => "foobar", :password_confirmation => "foobar" }
    end

    it "should create a user", :chapter8 => "true" do
      lambda do
        post :create, :user => @attr
      end.should change(User, :count).by(1)
    end

    it "should redirect to the user show page", :chapter8 => "true" do
      post :create, :user => @attr
      response.should redirect_to(user_path(assigns(:user)))
    end

    it "should have a welcome message", :chapter8 => "true" do
      post :create, :user => @attr
      flash[:success].should =~ /welcome to the sample app/i
    end
  end
  end
end
