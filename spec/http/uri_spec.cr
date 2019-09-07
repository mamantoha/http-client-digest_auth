require "../spec_helper"

describe "URI" do
  describe "#request_uri" do
    it do
      uri = URI.parse("http://foo.com")
      uri.request_uri.should eq("/")
    end

    it do
      uri = URI.parse("http://foo.com/posts?id=30&limit=5#time=1305298413")
      uri.request_uri.should eq("/posts?id=30&limit=5#time=1305298413")
    end

    it do
      uri = URI.parse("http://foo.com?id=30")
      uri.request_uri.should eq("/?id=30")
    end

    it do
      uri = URI.parse("http://foo.com#time=1305298413")
      uri.request_uri.should eq("/#time=1305298413")
    end
  end
end
