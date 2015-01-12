class UnorderedList
  def parse(text)
    text = text.gsub('*', '')
    "<ul>#{text}</ul>"
  end
end
