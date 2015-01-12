class Emphasis
  def parse(text)
    return text.gsub(/ [*]/, ' <em>').gsub(/[*] /, '</em> ')
  end
end
