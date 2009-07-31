require File.dirname(__FILE__) + '/../test_helper'

class MimeTypeTest < ActiveSupport::TestCase
  fixtures :mime_types

  def test_truth
    assert_instance_of MimeType, MimeType.find(:first)
  end
end

