require File.dirname(__FILE__) + '/../test_helper'

class ChunkTest < ActiveSupport::TestCase
  fixtures :chunks

  def test_truth
    assert_instance_of Chunk, Chunk.find(:first)
  end
end

