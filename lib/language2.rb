require 'base64'
require 'json'
require 'net/https'

module Language2
  class << self
    def get_data2(text)
      # APIのURL作成
      api_url = "https://language.googleapis.com/v1beta1/documents:analyzeSyntax?key=#{ENV['GOOGLE_API_KEY']}"
      # APIリクエスト用のJSONパラメータ
      params = {
        document: {
          type: 'PLAIN_TEXT',
          content: text
        }
      }.to_json
      # Google Cloud Natural Language APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      # APIレスポンス出力
      response_body = JSON.parse(response.body)
      response_body["tokens"].delete_if{|token| token["dependencyEdge"]["label"] == "PRT"}
      response_body["tokens"].delete_if{|token| token["dependencyEdge"]["label"] == "P"}
      response_body["tokens"].delete_if{|token| token["dependencyEdge"]["label"] == "SUFF"}
      response_body["tokens"].delete_if{|token| token["dependencyEdge"]["label"] == "AUX"}
      array = []
      response_body["tokens"].each do | text|
        array << text["text"]["content"] if text["text"]
      end

      pp array
      # puts response_body

      # if (error = response_body['error']).present?
      #   raise error['message']
      # else
      #   response_body['documentSentiment']['score']
      # end
    end
  end
end
