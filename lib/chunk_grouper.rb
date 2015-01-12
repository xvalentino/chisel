class ChunkGrouper
  def group(chunks)
    chunks.inject({}) do |organized_chunks, chunk|
      if chunk[0] == ('#')
        organized = {"#{chunk}" => :heading}
      else
        organized = {"#{chunk}" => :paragraph}
      end
      organized_chunks.merge!(organized)
    end

  end
end