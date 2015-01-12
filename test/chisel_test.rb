gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chisel.rb'
require_relative '../lib/heading.rb'
require_relative '../lib/paragraph.rb'
require_relative '../lib/list.rb'
require_relative '../lib/emphasis.rb'
require_relative '../lib/strongtag.rb'
require_relative '../lib/chunk.rb'
require_relative '../lib/chunkbuilder.rb'
require_relative '../lib/chunkdetector.rb'

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
    list = List.new
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

  def test_Chunk_exists
    chunk = Chunk.new
    assert chunk
  end

  def test_ChunkBuilder_exists
    chunkbuilder = ChunkBuilder.new
    assert chunkbuilder
  end

  def test_ChunkDetector_exists
    chunkdetector = ChunkDetector.new
    assert chunkdetector
  end

  def test_parse_takes_in_document
    chisel = Chisel.new
    chisel.parse("example text")
    assert chisel.document == "example text"
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
end
