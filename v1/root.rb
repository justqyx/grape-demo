require 'grape'
require_relative './post'

module API
  module V1
    class Root < Grape::API
      default_error_formatter :json
      content_type :json, 'application/json;charset=utf-8'
      format :json

      rescue_from :all do |e|
        case e
        when Grape::Exceptions::ValidationErrors
          Rack::Response.new([{
            error: '参数不符合要求，请检查参数是否按照 API 要求传输。',
            validation_errors: e.full_messages
          }.to_json], 400, {}).finish
        else
          Rack::Response.new([{ error: "API 接口异常" }.to_json], 500, {}).finish
        end
      end

      # mount your apis
      mount API::V1::Post
    end
  end
end
