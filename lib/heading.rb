class Heading
  def parse(string)
    heading_number = string.count('#')
    string_without_hashtags = string.gsub(/[#]/, "")
    "<h#{heading_number}>#{string_without_hashtags}</h#{heading_number}>"
  end
end
