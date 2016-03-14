require 'grape'
require_relative './v1/root'

module API
  class Dispatch < Grape::API
    mount API::V1::Root => '/api/v1'

    format :json
    content_type :json, 'application/json;charset=utf-8'

    route :any, '*path' do
      status 404
      { error: 'Page not found.' }
    end
  end
end
