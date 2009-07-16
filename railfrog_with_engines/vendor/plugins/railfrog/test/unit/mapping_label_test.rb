require File.dirname(__FILE__) + '/../test_helper'

class MappingLabelTest < ActiveSupport::TestCase
  fixtures :mapping_labels

  def test_truth
    assert_instance_of MappingLabel, MappingLabel.find(:first)
  end
end


