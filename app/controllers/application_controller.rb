
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/user" do
    User.first.to_json
  end

  # get all applications for user
  get "/applications" do
      User.find(params[:user_id]).applications.order("created_at DESC").to_json(include: :job)
  end

  # save new application
  post "/application" do
    user = User.find_by(id: params[:user_id])
    job_code = params[:link].match(/[0-9]{10}/).to_s    
    # begin
    if !job_code.empty?
      job = Job.find_by(code: job_code)
      if !job 
        job_data = job_info(job_code)
        job = Job.create(job_data)
      end
      application = user.applications.create(status: "applied", job: job)
      application.to_json(include: :job)
    #  else
    #    raise("invalid age")
    # end
    end
  end

  # change application staus
  patch  "/application/:id" do
    user = User.find_by(id: params[:user_id])
    application = user.applications.find_by(id: params[:id])
      application.update(status: params[:status])
      application.to_json
  end

  # delet application
  delete "/application/:id" do
    # user = User.find_by(id: params[:user_id])
    Application.delete(params[:id]).to_json
  end
end

