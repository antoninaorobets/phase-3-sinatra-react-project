class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  post "/create" do
    Job.create_job(params[:code])
  end

  post "/apply" do
    job = Job.create_job(params[:code])
    Application.create(user: params[:user_id], job: job, status: "applied")
  end

end

