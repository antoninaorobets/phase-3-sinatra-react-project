
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/user" do
    User.first.to_json
  end

end

