

def parse_link(link)
    code = link.match(/[0-9]{10}/)
    code.to_s
end
