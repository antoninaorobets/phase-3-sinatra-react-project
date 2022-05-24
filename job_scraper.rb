gem "open-uri"
gem "nokogiri"

def get_job(code)
    url = "https://www.linkedin.com/jobs-guest/jobs/api/jobPosting/#{code}"
    html = URI.open(url)
    resp = Nokogiri::HTML(html)
     
    job_hash ={
        :code => code,
        :title => resp.css(".top-card-layout__title").text,
        :company => resp.css(".topcard__org-name-link.topcard__flavor--black-link").text.strip,
        :location => resp.css(".topcard__flavor.topcard__flavor--bullet").text.strip,
        # :job_url => url,
        # :company_link => resp.css(".topcard__org-name-link.topcard__flavor--black-link").attribute("href").value,
        :logo => resp.css("img.artdeco-entity-image.artdeco-entity-image--square-5").attribute("data-delayed-url").value,
        :description => resp.css(".show-more-less-html__markup.show-more-less-html__markup--clamp-after-5")
        }
#     description = []
# description_xml.children.each do |p|
#     text =  p.text.strip.gsub(/^$\n/,'') 
#      if !text.empty? 
#         description <<  text
#      end
# end

end

get_job("2917053551")