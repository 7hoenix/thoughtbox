require 'rails_helper'

RSpec.describe Link, type: :model do
  before(:each) do
    @link = Link.new(url: "http://google.com", title: "google")
  end

  it "has a correct attributes" do
    expect(@link).to be_valid
  end

  it "needs to have a valid url" do
    invalid_urls = %w[http//google.com ://google.com htp://google.com]
    invalid_urls.each do |invalid_url|
      @link.url = invalid_url
      expect(@link).to_not be_valid
    end
  end

  it "needs to have a title" do
    @link.title = ""
    expect(@link).to_not be_valid
  end

  it "defaults its status to false" do
    expect(@link.status).to eq(false)
  end
end
