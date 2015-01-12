class StrongTag
  def parse(text)
    return text.gsub(/ [*][*]/, ' <strong>').gsub(/[*][*] /, '</strong> ')
  end
end
