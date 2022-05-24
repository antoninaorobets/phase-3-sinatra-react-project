class Job < ActiveRecord::Base
    has_many :applications
    has_many :users, through: :applications

    def self.create_job(code)
        url = "https://www.linkedin.com/jobs-guest/jobs/api/jobPosting/#{code}"
        html = URI.open(url)
        resp = Nokogiri::HTML(html)
     
        job_hash ={
            :code => code,
            :title => resp.css(".top-card-layout__title").text,
            :company => resp.css(".topcard__org-name-link.topcard__flavor--black-link").text.strip,
            :location => resp.css(".topcard__flavor.topcard__flavor--bullet").text.strip,
            :url => url,
            :company_link => resp.css(".topcard__org-name-link.topcard__flavor--black-link").attribute("href").value,
            :logo => resp.css("img.artdeco-entity-image.artdeco-entity-image--square-5").attribute("data-delayed-url").value,
            :description => resp.css(".show-more-less-html__markup.show-more-less-html__markup--clamp-after-5")
            }

        self.create(job_hash)

    end
end