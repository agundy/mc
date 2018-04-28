# adapted from https://github.com/travis-ci/webhook-signature-verifier/blob/master/Gemfile
require 'faraday'
require 'openssl'
require 'base64'

class TravisVerifier
  def initialize
  end

  def verify(params)
    begin
      json_payload = params.fetch('payload', '')
      signature    = request.env["HTTP_SIGNATURE"]

      pkey = OpenSSL::PKey::RSA.new(public_key)

      if pkey.verify(
          OpenSSL::Digest::SHA1.new,
          Base64.decode64(signature),
          json_payload
      )
        return true
      else
        return false
      end

    rescue => e
      logger.info "exception=#{e.class} message=\"#{e.message}\""
      logger.debug e.backtrace.join("\n")

      return false
    end
  end

  private

  def public_key
    conn = Faraday.new(:url => API_HOST) do |faraday|
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get '/config'
    JSON.parse(response.body)["config"]["notifications"]["webhook"]["public_key"]
  rescue
    ''
  end
end
