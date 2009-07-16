require File.dirname(__FILE__) + '/../test_helper'

class FileExtensionTest < ActiveSupport::TestCase
  fixtures :file_extensions

  def test_truth
    assert_instance_of FileExtension, FileExtension.find(:first)
  end
end

