class Merlion::Response
  attr_accessor :status_code, :headers, :body, :location

  def initialize
    @headers = {}
  end

  def rack_response
    [status_code, headers, Array(body)]
  end
end
