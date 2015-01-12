gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chisel.rb'
require_relative '../lib/heading.rb'
require_relative '../lib/paragraph.rb'
require_relative '../lib/unordered_list.rb'
require_relative '../lib/ordered_list.rb'
require_relative '../lib/emphasis.rb'
require_relative '../lib/strongtag.rb'
require_relative '../lib/chunkify.rb'
require_relative '../lib/chunk_grouper.rb'

class ChiselTest < MiniTest::Test

  def test_Chisel_exits
    chisel = Chisel.new
    assert chisel
  end

  def test_Heading_exists
    heading = Heading.new
    assert heading
  end

  def test_Paragraph_exists
    paragraph = Paragraph.new
    assert paragraph
  end

  def test_List_exists
    list = UnorderedList.new
    assert list
  end

  def test_Emphasis_exists
    emphasis = Emphasis.new
    assert emphasis
  end

  def test_StrongTag_exists
    strongtag = StrongTag.new
    assert strongtag
  end

  def test_chunkify_exists
    chunk = Chunkify.new
    assert chunk
  end

  def test_chunk_grouper_exists
    chunkdetector = ChunkGrouper.new
    assert chunkdetector
  end

  def test_parse_takes_in_document
    skip
  end

  def test_header_parses_heading_1
    heading = Heading.new
    assert_equal "<h1>Heading</h1>", heading.parse("#Heading")
  end

  def test_header_parses_heading_2
    heading = Heading.new
    assert_equal "<h2>Heading</h2>", heading.parse("##Heading")
  end

  def test_paragraph_parses
    paragraph = Paragraph.new
    assert_equal "<p>Paragraph blah blah blah</p>", paragraph.parse("Paragraph blah blah blah")
  end

  def test_chunkify_makes_chunks
    chunk = Chunkify.new
    assert_equal ["chunk1", "#chunk2"], chunk.divide("chunk1\n#chunk2")
  end

  def test_chunkgrouper_hashes_chunks
    chunkgrouper = ChunkGrouper.new
    chunks = ["chunk1", "#chunk2"]
    organized_chunks = { "chunk1" => :paragraph, "#chunk2" => :heading }
    assert_equal organized_chunks, chunkgrouper.group(chunks)
  end

  def test_emphasis_works
    emphasis = Emphasis.new
    before = "this *emphasis* is awesome"
    after = "this <em>emphasis</em> is awesome"
    assert_equal after, emphasis.parse(before)
  end

  def test_strong_tag_works
    strong = StrongTag.new
    before = "this **strongtag** is crazy"
    after = "this <strong>strongtag</strong> is crazy"
    assert_equal after, strong.parse(before)
  end

  def test_unordered_list_parses
    list = UnorderedList.new
    before = "*okay"
    assert_equal "<li>okay</li>", list.parse(before)
  end

  def test_ordered_list_parses
    skip
  end
end
