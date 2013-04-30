require 'spec_helper'

describe EventsController do
  describe "GET index" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
 
  describe "GET create" do
    it "should be successful" do
      get 'events/create'
      response.should be_success
    end
  end

  describe "GET new" do
    it "should be successful" do
      get 'events/new'
      response.should be_success
    end
  end
end
