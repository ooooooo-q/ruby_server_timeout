require 'open-uri'

class TimeoutTest
  def call(env)
    req = Rack::Request.new(env)
    type = ""

    case req.path
    when "/sleep" then
      type = "sleep"
      sleep 60 * 2

    when "/regexp" then
      type = "regexp"
      # https://owasp.org/www-community/attacks/Regular_expression_Denial_of_Service_-_ReDoS
      /([^\r]+)+[\r]+/.match("a" * 40)

    when "/file_io" then
      type = "file_io"
      # todo

    when "/network_io" then
      type = "network_io"
      url = "#{req.base_url}/sleep"
      URI.parse(url).read # Net::HTTP#read_timeoutにより60秒でタイムアウト
    end

    [
      200,
      {},
      ["Timeout test. (#{type})"]
    ]
  end
end

run TimeoutTest.new