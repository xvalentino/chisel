class UnorderedList
  def parse(text)
    text = text.gsub('*', '')
    "<li>#{text}</li>"
  end
end
