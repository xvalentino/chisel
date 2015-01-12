class Chunkify
  def divide(unchunked_text)
    unchunked_text.split(/[\n]+/)
  end

  def unordered_list
    #if consecutive arrays start with '*' combine them into one list element
    #then, delete the two elements you used to create the list element
  end
end
