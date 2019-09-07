require "uri"

class URI
  # Returns the full path for an HTTP request, as required by `HTTP::Request`.
  #
  # Example:
  #
  # ```
  # uri = URI.parse("http://foo.com/posts?id=30&limit=5#time=1305298413")
  # uri.request_uri # => "/posts?id=30&limit=5#time=1305298413"
  # ```
  def request_uri : String
    return "/" unless @path

    url = String::Builder.build do |io|
      io << @path
      io << "?#{@query}" if @query
      io << "##{@fragment}" if @fragment
    end.to_s

    url.starts_with?("/") ? url : "/" + url
  end
end
