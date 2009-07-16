require File.dirname(__FILE__) + '/../test_helper'

class ChunkVersionTest < ActiveSupport::TestCase
  fixtures :chunk_versions

  def test_truth
    assert_instance_of ChunkVersion, ChunkVersion.find(:first)
  end
end

