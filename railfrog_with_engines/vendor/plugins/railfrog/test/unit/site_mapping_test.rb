require File.dirname(__FILE__) + '/../test_helper'

class SiteMappingTest < ActiveSupport::TestCase

  fixtures :site_mappings, :mapping_labels

  def setup
    @root = site_mappings(:root)
    @count = SiteMapping.count
    assert_equal 9, @count
    assert_equal 6, MappingLabel.count
  end

  def test_self_and_ancestors
    assert_equal [site_mappings(:root)], site_mappings(:root).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:index)], site_mappings(:index).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:images)], site_mappings(:images).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:images), site_mappings(:logo)], site_mappings(:logo).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:images), site_mappings(:background)], site_mappings(:background).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:layouts)], site_mappings(:layouts).self_and_ancestors
    assert_equal [site_mappings(:root), site_mappings(:layouts), site_mappings(:main_layout)], site_mappings(:main_layout).self_and_ancestors

    SiteMapping.delete_all
    assert_equal 0, SiteMapping.count
    root = SiteMapping.find_root 
    assert_equal [root], root.self_and_ancestors
  end

  def test_level
    assert_equal 0, site_mappings(:root).level
    assert_equal 1, site_mappings(:index).level
    assert_equal 1, site_mappings(:images).level
    assert_equal 2, site_mappings(:logo).level
    assert_equal 2, site_mappings(:background).level
    assert_equal 1, site_mappings(:layouts).level
    assert_equal 2, site_mappings(:main_layout).level

    SiteMapping.delete_all
    assert_equal 0, SiteMapping.find_root.level
  end

  def test_root
    assert_equal site_mappings(:root), site_mappings(:root).root
    assert_equal site_mappings(:root), site_mappings(:index).root
    assert_equal site_mappings(:root), site_mappings(:images).root
    assert_equal site_mappings(:root), site_mappings(:logo).root
    assert_equal site_mappings(:root), site_mappings(:background).root
  end

  def test_find_root
    common_test SiteMapping::ROOT_DIR, SiteMapping.root
    assert_equal @count, SiteMapping.count

    @root.destroy
    assert_equal 0, SiteMapping.count

    # the root folder should be created now
    common_test SiteMapping::ROOT_DIR, SiteMapping.find_root
    assert_equal 1, SiteMapping.count

    # and now it should be returned from the db
    common_test SiteMapping::ROOT_DIR, SiteMapping.root
    assert_equal 1, SiteMapping.count
  end

  def test_create_child
    child = @root.create_child(:path_segment => 'cakes', :site=>@root)
    common_test 'cakes', child
    assert_equal @count+1, SiteMapping.count
    assert_equal @root.id, child.parent_id
    assert_equal @root.id, child.root.id
    assert_equal 1, child.level

    child2 = child.create_child(:path_segment => 'index.html', :site=>child)
    common_test 'index.html', child2
    assert_equal @count+2, SiteMapping.count
    assert_equal child.id, child2.parent_id
    assert_equal @root.id, child2.root.id
    assert_equal 2, child2.level

    child = @root.create_child(:path_segment => 'cakes2', :site=>@root)
    common_test 'cakes2', child
    assert_equal @count+3, SiteMapping.count
    assert_equal @root.id, child.parent_id
    assert_equal @root.id, child.root.id
    assert_equal 1, child.level
  end

  def test_create_child_plus
    SiteMapping.delete_all
    assert_equal 0, SiteMapping.count

    root = SiteMapping.find_root
    assert_equal 1, SiteMapping.count
    assert_equal 1, root.lft
    assert_equal 2, root.rgt
    assert_nil root.parent_id

    child1 = root.create_child_by_path_segment(:path_segment => 'cakes', :site=>root)
    assert_equal 2, SiteMapping.count
    assert_equal 1, root.lft
    assert_equal 2, child1.lft
    assert_equal 3, child1.rgt
    assert_equal 4, root.rgt
    assert_nil root.parent_id
    assert_equal root.id, child1.parent_id

    child2 = child1.create_child_by_path_segment(:path_segment =>'chocolate_cakes', :site=>child1)
    root.reload
    assert_equal 3, SiteMapping.count
    assert_equal 1, root.lft
    assert_equal 2, child1.lft
    assert_equal 3, child2.lft
    assert_equal 4, child2.rgt
    assert_equal 5, child1.rgt
    assert_equal 6, root.rgt
    assert_nil root.parent_id
    assert_equal root.id, child1.parent_id
    assert_equal child1.id, child2.parent_id

    child3 = child2.create_child_by_path_segment(:path_segment =>'index.html', :site=>child2)
    child1.reload
    root.reload
    assert_equal 4, SiteMapping.count
    assert_equal 1, root.lft
    assert_equal 2, child1.lft
    assert_equal 3, child2.lft
    assert_equal 4, child3.lft
    assert_equal 5, child3.rgt
    assert_equal 6, child2.rgt
    assert_equal 7, child1.rgt
    assert_equal 8, root.rgt
    assert_nil root.parent_id
    assert_equal root.id, child1.parent_id
    assert_equal child1.id, child2.parent_id
    assert_equal child2.id, child3.parent_id
  end

  def test_create_child__internal
    @root.
      create_child(:path_segment => 'child1', :is_internal => true, :site=>@root).
      create_child(:path_segment => 'child2', :site=>@root).
      create_child(:path_segment => 'child3', :is_internal => false, :site=>@root).
      create_child(:path_segment => 'child4', :is_internal => true, :site=>@root)

    assert SiteMapping.find_by_path_segment('child1').is_internal
    assert SiteMapping.find_by_path_segment('child4').is_internal

    assert !SiteMapping.find_by_path_segment('child2').is_internal
    assert !SiteMapping.find_by_path_segment('child3').is_internal
  end

  def test_create_child__with_same_name
    child = @root.create_child(:path_segment => 'child', :site=>@root)
    common_test 'child', child
    assert_equal @count+1, SiteMapping.count

    #FIXME: think about this point - any better approches?
    exc = assert_raise( ActiveRecord::RecordInvalid) { @root.create_child(:path_segment => 'child', :site=>@root)  }
    assert /Path segment has already been taken/ =~ exc.message
    assert_equal @count+1, SiteMapping.count

    exc = assert_raise(ActiveRecord::RecordNotFound) {child =@root.create_child(:path_segment => 'child')}
    assert_equal "Couldn't find SiteMapping without an ID", exc.message
    assert_equal @count+1, SiteMapping.count
  end

  def test_create_by_path_segment
    child = @root.create_child_by_path_segment(:path_segment => 'cakes', :site=>@root)
    common_test 'cakes', child
    assert_equal @count+1, SiteMapping.count
    assert_equal @root.id, child.parent_id
    assert_equal @root.id, child.root.id
    assert_equal 1, child.level

    child2 = child.create_child_by_path_segment(:path_segment => 'index.html', :site=>child)
    common_test 'index.html', child2
    assert_equal @count+2, SiteMapping.count
    assert_equal child.id, child2.parent_id
    assert_equal @root.id, child2.root.id
    assert_equal 2, child2.level

    child = @root.create_child_by_path_segment(:path_segment => 'cakes2', :site=>@root)
    common_test 'cakes2', child
    assert_equal @count+3, SiteMapping.count
    assert_equal @root.id, child.parent_id
    assert_equal @root.id, child.root.id
    assert_equal 1, child.level
  end

  def test_find_or_create_child
    child = @root.find_or_create_child(:path_segment => 'index2.html', :site=>@root)
    common_test 'index2.html', child
    assert_equal @count+1, SiteMapping.count
    assert_equal @root.id, child.parent_id
    assert_equal @root.id, child.root.id
    assert_equal 1, child.level

    child = @root.find_or_create_child(:path_segment => 'index2.html', :site=>@root)
    common_test 'index2.html', child
    assert_equal @count+1, SiteMapping.count

    child1 = @root.find_or_create_child(:path_segment => 'cakes', :site=>@root )
    common_test 'cakes', child1
    assert_equal @count+2, SiteMapping.count
    assert_equal @root.id, child1.parent_id
    assert_equal @root.id, child1.root.id
    assert_equal 1, child1.level

    child1 = @root.find_or_create_child( :path_segment => 'cakes', :site=>@root)
    common_test 'cakes', child1
    assert_equal @count+2, SiteMapping.count

    child2 = child1.find_or_create_child(:path_segment => 'index3.html', :site=>child1)
    common_test 'index3.html', child2
    assert_equal @count+3, SiteMapping.count
    assert_equal child1.id, child2.parent_id
    assert_equal @root.id, child2.root.id
    assert_equal 2, child2.level

    child2 = child1.find_or_create_child(:path_segment => 'index3.html', :site=>child1)
    common_test 'index3.html', child2
    assert_equal @count+3, SiteMapping.count
  end

  def test_is_root
    assert @root.root?
    assert_nil @root.parent_mapping

    child = @root.create_child(:path_segment => 'cakes', :site=>@root )
    assert !child.root?
    common_test SiteMapping::ROOT_DIR, child.parent_mapping

    child = child.create_child(:path_segment => 'index.html', :site=>child)
    assert !child.root?
    common_test 'cakes', child.parent_mapping

    child = child.find_or_create_child( :path_segment => 'index5.html', :site=>child)
    assert !child.root?
    common_test 'index.html', child.parent_mapping

    root = SiteMapping.find_root
    assert_nil root.root?
    assert_nil root.parent_mapping

    SiteMapping.delete_all
    assert SiteMapping.find_root.root?
  end

  def test_destroy
    assert @count > 0
    @root.destroy
    assert_equal 0, SiteMapping.count

    root = SiteMapping.find_root
    assert_equal 1, SiteMapping.count
    root.destroy
    assert_equal 0, SiteMapping.count, "Initially we had 1 site_mappings"

    root_0 = SiteMapping.find_root
    root=root_0.create_child_by_path_segment(:path_segment=>'cakes', :site=>root_0)
    assert_equal 2, SiteMapping.count
    root = SiteMapping.root
    root.destroy
    assert_equal 0, SiteMapping.count, "Initially we had 2 site_mappings"

    root = SiteMapping.find_root
    root=root.create_child_by_path_segment(:path_segment=>'cakes', :site=>root)
    root=root.create_child_by_path_segment(:path_segment=>'chocolate_cakes', :site=>root)
    assert_equal 3, SiteMapping.count
    root = SiteMapping.root
    root.destroy
    assert_equal 0, SiteMapping.count, "Initially we had 3 site_mappings"

    root = SiteMapping.find_root
    root=root.create_child_by_path_segment(:path_segment=>'cakes', :site=>root)
    root=root.create_child_by_path_segment(:path_segment=>'chocolate_cakes', :site=>root)
    root=root.create_child_by_path_segment(:path_segment=>'index.html', :site=>root)
    assert_equal 4, SiteMapping.count
    root = SiteMapping.root
    root.destroy
    assert_equal 0, SiteMapping.count, "Initially we had 4 site_mappings"

    branch = SiteMapping.find_root
    branch=branch.create_child_by_path_segment(:path_segment=>'cakes', :site=>branch)
    branch1=branch.create_child_by_path_segment(:path_segment=>'chocolate_cakes', :site=>branch)
    branch3=branch1.create_child_by_path_segment(:path_segment=>'index.html', :site=>branch1)
    branch2=branch.create_child_by_path_segment(:path_segment=>'apple_cakes', :site=>branch)
    branch4=branch2.create_child_by_path_segment(:path_segment=>'index.html', :site=>branch2)
    assert_equal 6, SiteMapping.count
    branch.destroy
    assert_equal 1, SiteMapping.count
    assert_equal SiteMapping::ROOT_DIR, SiteMapping.find(:first).path_segment
  end

  def test_destroy__with_labels
    assert @count > 0
    assert MappingLabel.count > 0
    @root= SiteMapping.root
    @root.destroy
    assert_equal 0, SiteMapping.count
    assert_equal 0, MappingLabel.count
  end

  def test_destroy__simple_with_labels
    assert @count > 0
    assert MappingLabel.count > 0
    @root.destroy
    assert_equal 0, SiteMapping.count
    assert_equal 0, MappingLabel.count
  end

  def test_full_path
    # for root
    assert_equal '/', @root.full_path

    # for external mappings
    assert_equal '/images', site_mappings(:images).full_path
    assert_equal '/images/logo.jpg', site_mappings(:logo).full_path
    assert_equal '/images/background.gif', site_mappings(:background).full_path
    assert_equal '/index.html', site_mappings(:index).full_path

    # for internal mappings
    assert_equal '/layouts/main_layout', site_mappings(:main_layout).full_path
    assert_equal '/layouts/header', site_mappings(:header).full_path
    assert_equal '/layouts/footer', site_mappings(:footer).full_path

    # for just created mappings
    leaf_1 = @root.create_child_by_path_segment(:path_segment=>'cakes', :site=> @root)
    leaf=leaf_1.create_child_by_path_segment(:path_segment=>'chocalate_cake.html', :site=>leaf_1)
    assert_equal '/cakes/chocalate_cake.html', leaf.full_path
  end

  def test_find_mapping
    common_test SiteMapping::ROOT_DIR, SiteMapping.find_mapping
    common_test SiteMapping::ROOT_DIR, SiteMapping.find_mapping([])

    subtest_find_mapping [SiteMapping::ROOT_DIR]
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'images']
    subtest_find_mapping ['images']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'images', 'logo.jpg']
    subtest_find_mapping ['images', 'logo.jpg']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'images', 'background.gif']
    subtest_find_mapping ['images', 'background.gif']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'layouts', 'main_layout']
    subtest_find_mapping ['layouts', 'main_layout']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'layouts', 'header']
    subtest_find_mapping ['layouts', 'header']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'layouts', 'footer']
    subtest_find_mapping ['layouts', 'footer']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'index.html']
    subtest_find_mapping ['index.html']

    # for just created mappings
    leaf = @root.create_child_by_path_segment(:path_segment=>'cakes', :site=> @root)
    leaf=leaf.create_child_by_path_segment(:path_segment=>'chocalate_cake.html', :site=> leaf)
    subtest_find_mapping ['cakes', 'chocalate_cake.html']
    subtest_find_mapping [SiteMapping::ROOT_DIR, 'cakes', 'chocalate_cake.html']

    assert_nil SiteMapping.find_mapping(['no'])
    assert_nil SiteMapping.find_mapping(['no', 'such'])
    assert_nil SiteMapping.find_mapping(['no', 'such', 'path'])
  end

  def test_find_mapping__internal
    # find internal site_mapping with external_only = true
    assert_nil SiteMapping.find_mapping(['layouts', 'main_layout'], nil, true)
    assert_nil SiteMapping.find_mapping(['layouts', 'header'], nil, true)
    assert_nil SiteMapping.find_mapping(['layouts', 'footer'], nil, true)

    # check with default external_only = false
    common_test 'main_layout', SiteMapping.find_mapping(['layouts', 'main_layout'])
    common_test 'header', SiteMapping.find_mapping(['layouts', 'header'])
    common_test 'footer', SiteMapping.find_mapping(['layouts', 'footer'])

    # check with external_only = false
    common_test 'main_layout', SiteMapping.find_mapping(['layouts', 'main_layout'], nil, false)
    common_test 'header', SiteMapping.find_mapping(['layouts', 'header'], nil, false)
    common_test 'footer', SiteMapping.find_mapping(['layouts', 'footer'], nil, false)

    # check site_mapping with explicit is_internal = false
    common_test 'index.html', SiteMapping.find_mapping(['index.html'])
    common_test 'index.html', SiteMapping.find_mapping(['index.html'], nil, false)
    common_test 'index.html', SiteMapping.find_mapping(['index.html'], nil, true)

    # check site_mapping with implicit is_internal = false (database default value)
    common_test 'logo.jpg', SiteMapping.find_mapping(['images', 'logo.jpg'])
    common_test 'logo.jpg', SiteMapping.find_mapping(['images', 'logo.jpg'], nil, false)
    common_test 'logo.jpg', SiteMapping.find_mapping(['images', 'logo.jpg'], nil, true)
  end

  def test_find_mapping__with_labels
    sm = SiteMapping.find_mapping(['images', 'logo.jpg'])

    assert_not_nil sm.instance_variables.find {|v| v == '@mapping_labels'}
    assert_not_nil sm.parent_mapping.instance_variables.find {|v| v == '@mapping_labels'}
#    assert_not_nil sm.parent_mapping.parent_mapping.instance_variables.find {|v| v == '@mapping_labels'}

    assert_equal 4, sm.mapping_labels.size
    assert sm.mapping_labels.include?(mapping_labels(:logo_label1))
    assert sm.mapping_labels.include?(mapping_labels(:logo_label2))
    assert sm.mapping_labels.include?(mapping_labels(:logo_label3))
    assert sm.mapping_labels.include?(mapping_labels(:logo_label4))

    assert_equal 0, sm.parent_mapping.mapping_labels.size

    assert_equal 1, sm.parent_mapping.parent_mapping.mapping_labels.size
    assert_equal mapping_labels(:root_label), sm.parent_mapping.parent_mapping.mapping_labels[0]
  end

  def test_process_labels
    result = { "index-page" => 'index.html' }
    assert_equal result, SiteMapping.process_labels(SiteMapping.root)
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping)
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping( ['images']))
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping( ['images', 'background.gif']))

    result['label1'] = 'value1'
    result['label2'] = 'value2'
    result['label3'] = 'value3'
    result['label4'] = 'value4'
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping( ['images', 'logo.jpg'] ))

    result = { 'index-page' => mapping_labels(:layouts_label).value }
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping( ['layouts']))
    assert_equal result, SiteMapping.process_labels(SiteMapping.find_mapping( ['layouts', 'main_layout'] ))
  end

  def test_find_mapping__with_version
    #flunk 'need to be tested'
  end

  def test_find_mapping_and_labels_and_chunk
    result = SiteMapping.find_mapping_and_labels_and_chunk([''])
    assert_not_nil result
    assert_instance_of Array, result
    assert_equal 3, result.size
    assert_nil result[2]
    assert_instance_of Hash, result[1]
    assert_equal 1, result[1].size
    assert_instance_of SiteMapping, result[0]

    result = SiteMapping.find_mapping_and_labels_and_chunk(['images'])
    assert_not_nil result
    assert_instance_of Array, result
    assert_equal 3, result.size
    assert_nil result[2]
    assert_instance_of Hash, result[1]
    assert_equal 1, result[1].size
    assert_instance_of SiteMapping, result[0]

    result = SiteMapping.find_mapping_and_labels_and_chunk(['images', 'logo.jpg'])
    assert_not_nil result
    assert_instance_of Array, result
    assert_equal 3, result.size
    assert_nil result[2]
    assert_instance_of Hash, result[1]
    assert_equal 5, result[1].size
    assert_instance_of SiteMapping, result[0]

    # fails on internal chunk
    result = SiteMapping.find_mapping_and_labels_and_chunk(['layouts', 'main_layout'])
    assert_not_nil result
    assert_instance_of Array, result
    assert_equal 3, result.size
    assert_nil result[2]
    assert_instance_of Hash, result[1]
    assert_equal 1, result[1].size
    assert_instance_of SiteMapping, result[0]

    # fails on internal chunk
    assert_nil SiteMapping.find_mapping_and_labels_and_chunk(['layouts', 'main_layout'], nil, true)

    # fails on bad path
    assert_nil SiteMapping.find_mapping_and_labels_and_chunk(['no-such-path'])
  end

  def test_kid_dirs
    # flunk
  end

  def subtest_find_mapping(path, external_only = false)
    sm = SiteMapping.find_mapping(path, nil, external_only)
    assert !sm.is_internal if external_only

    path.reverse.each_with_index {|p, i|
      common_test p, sm
      sm = sm.parent_mapping
    }
  end

  def common_test(path_segment, sm)
    assert_not_nil sm
    assert_instance_of SiteMapping, sm
#    assert_valid sm
    assert sm.errors.empty?
    assert_equal path_segment, sm.path_segment
  end

end

    
 
