class User < ActiveRecord::Base
    has_many :applications
    has_many :jobs, through: :applications

    # def jobs
    #     all =[]
    #     self.applications.each do |application|

    #     end
    # end
    
end