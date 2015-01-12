class ChunkGrouper
  def group(chunks)
    grouped_chunks = chunks.inject({}) do |organized_chunks, chunk|
      if chunk[0] == ('#')
        organized = {"#{chunk}" => :heading}
      elsif chunk.count('*').odd?
        organized = {"#{chunk}" => :unordered_list}
      elsif chunk[0] == (/\d/)
        organized = {"#{chunk}" => :ordered_list}
      else
        organized = {"#{chunk}" => :paragraph}
      end
      organized_chunks.merge!(organized)
    end
    grouped_chunks
  end
end
