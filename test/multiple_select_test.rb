require File.dirname(__FILE__) + '/test_helper'

class MultipleSelectTest < Test::Unit::TestCase #:nodoc:
  include FightTheMelons::Helpers::FormMultipleSelectHelper
  
  fixtures :nodes, :fathers, :sons
  
  def test_cfms_empty
    assert_equal "", checkboxes_for_multiple_select('name', [])
  end
  
  def test_cfms_one_item
    assert_dom_equal "<div>" +
      "<input id=\"nametest\" name=\"name[]\" type=\"checkbox\" value=\"test\" />" +
      "<label for=\"nametest\">test</label></div>",
      checkboxes_for_multiple_select('name', ['test'])
  end
  
  def test_cfms_two_items
    assert_dom_equal "<div>" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div>" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'])
  end
  
  def test_cfms_array_not_strings
    assert_dom_equal "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2])
  end
  
  def test_cfms_text_value_array
    assert_dom_equal "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">first test</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">second test</label></div>",
      checkboxes_for_multiple_select('name', [['first test', 1], ['second test', 2]])
  end
  
  def test_cfms_hash
    assert_dom_equal "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">second test</label></div>\n" +
      "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">first test</label></div>",
      checkboxes_for_multiple_select('name', {'first test' => 1, 'second test' => 2})
  end
  
  def test_cfms_array_with_selected
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [1])
    assert_dom_equal "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [2])
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [1,2])
  end
  
  def test_cfms_text_value_array_with_selected
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">first test</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">second test</label></div>",
      checkboxes_for_multiple_select('name', [['first test', 1], ['second test', 2]], [1])
    assert_dom_equal "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">first test</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">second test</label></div>",
      checkboxes_for_multiple_select('name', [['first test', 1], ['second test', 2]], [2])
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">first test</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">second test</label></div>",
      checkboxes_for_multiple_select('name', [['first test', 1], ['second test', 2]], [1,2])
  end
  
  def test_cfms_hash_with_selected
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"nameesp\" name=\"name[]\" type=\"checkbox\" value=\"esp\" />" +
      "<label for=\"nameesp\">Spain</label></div>\n" +
      "<div>" +
      "<input id=\"nameeng\" name=\"name[]\" type=\"checkbox\" value=\"eng\" />" +
      "<label for=\"nameeng\">England</label></div>",
      checkboxes_for_multiple_select('name', { 'Spain' => 'esp', 'England' => 'eng' }, ['esp'])
    assert_dom_equal "<div>" +
      "<input id=\"nameesp\" name=\"name[]\" type=\"checkbox\" value=\"esp\" />" +
      "<label for=\"nameesp\">Spain</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"nameeng\" name=\"name[]\" type=\"checkbox\" value=\"eng\" />" +
      "<label for=\"nameeng\">England</label></div>",
      checkboxes_for_multiple_select('name', { 'Spain' => 'esp', 'England' => 'eng' }, ['eng'])
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"nameesp\" name=\"name[]\" type=\"checkbox\" value=\"esp\" />" +
      "<label for=\"nameesp\">Spain</label></div>\n" +
      "<div>" +
      "<input checked=\"checked\" id=\"nameeng\" name=\"name[]\" type=\"checkbox\" value=\"eng\" />" +
      "<label for=\"nameeng\">England</label></div>",
      checkboxes_for_multiple_select('name', { 'Spain' => 'esp', 'England' => 'eng' }, ['esp', 'eng'])
  end
  
  def test_cfms_position
    assert_dom_equal "<div>" +
      "<input id=\"nametest\" name=\"name[]\" type=\"checkbox\" value=\"test\" />" +
      "<label for=\"nametest\">test</label></div>",
      checkboxes_for_multiple_select('name', ['test'], [], :position => :right)
    assert_dom_equal "<div>" +
      "<label for=\"nametest\">test</label>" +
      "<input id=\"nametest\" name=\"name[]\" type=\"checkbox\" value=\"test\" /></div>",
      checkboxes_for_multiple_select('name', ['test'], [], :position => :left)
  end
  
  def test_cfms_inner_class
    assert_dom_equal "<div class=\"testclass\">" +
      "<input id=\"nametest\" name=\"name[]\" type=\"checkbox\" value=\"test\" />" +
      "<label for=\"nametest\">test</label></div>",
      checkboxes_for_multiple_select('name', ['test'], [], :inner_class => 'testclass')
  end
  
  def test_cfms_alternate
    assert_dom_equal "<div>" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div class=\"alt\">" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'], [], :alternate => true)
    assert_dom_equal "<div class=\"testclass\">" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div class=\"testclass alt\">" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'], [], :alternate => true, :inner_class => 'testclass')
    assert_dom_equal "<div>" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div class=\"alternative\">" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'], [], :alternate => true, :alternate_class => 'alternative')
    assert_dom_equal "<div>" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div class=\"alt\">" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'], [], :alternate => true, :initial_alternate => false)
    assert_dom_equal "<div class=\"alt\">" +
      "<input id=\"nametest1\" name=\"name[]\" type=\"checkbox\" value=\"test1\" />" +
      "<label for=\"nametest1\">test1</label></div>\n" +
      "<div>" +
      "<input id=\"nametest2\" name=\"name[]\" type=\"checkbox\" value=\"test2\" />" +
      "<label for=\"nametest2\">test2</label></div>",
      checkboxes_for_multiple_select('name', ['test1', 'test2'], [], :alternate => true, :initial_alternate => true)
  end
  
  def test_cfms_disabled
    assert_dom_equal "<div>" +
      "<input id=\"name1\" name=\"name[]\" type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [], :disabled => false)
    assert_dom_equal "<div>" +
      "<input disabled=\"disabled\" id=\"name1\" name=\"name[]\" " +
      "type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input disabled=\"disabled\" id=\"name2\" name=\"name[]\" " +
      "type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [], :disabled => true)
    assert_dom_equal "<div>" +
      "<input disabled=\"disabled\" id=\"name1\" name=\"name[]\" " +
      "type=\"checkbox\" value=\"1\" />" +
      "<label for=\"name1\">1</label></div>\n" +
      "<div>" +
      "<input id=\"name2\" name=\"name[]\" " +
      "type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">2</label></div>",
      checkboxes_for_multiple_select('name', [1, 2], [], :disabled => [1])
  end
  
  def test_cfcfms
    assert_dom_equal "<div>" +
      "<input id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">Node 1</label></div>\n" +
      "<div><input id=\"name3\" name=\"name[]\" type=\"checkbox\" value=\"3\" />" +
      "<label for=\"name3\">Node 2</label></div>\n" +
      "<div><input id=\"name4\" name=\"name[]\" type=\"checkbox\" value=\"4\" />" +
      "<label for=\"name4\">Node 3</label></div>",
      checkboxes_from_collection_for_multiple_select('name', Node.find_all_by_parent_id(1), :id, :name)
    assert_dom_equal "",
      checkboxes_from_collection_for_multiple_select('name', Node.find_all_by_parent_id(33), :id, :name) # id 33 doesn't exist nor have children
  end
  
  def test_cfcms_with_selected
    assert_dom_equal "<div>" +
      "<input checked=\"checked\" id=\"name2\" name=\"name[]\" type=\"checkbox\" value=\"2\" />" +
      "<label for=\"name2\">Node 1</label></div>\n" +
      "<div><input id=\"name3\" name=\"name[]\" type=\"checkbox\" value=\"3\" />" +
      "<label for=\"name3\">Node 2</label></div>\n" +
      "<div><input checked=\"checked\" id=\"name4\" name=\"name[]\" type=\"checkbox\" value=\"4\" />" +
      "<label for=\"name4\">Node 3</label></div>",
      checkboxes_from_collection_for_multiple_select('name', Node.find_all_by_parent_id(1), :id, :name, [2, 4])
  end
  
  def test_ms
    @f = Father.new
    assert_dom_equal "<div><div>" +
      "<input id=\"f_method_for_test_test\" name=\"f[method_for_test][]\" " +
      "type=\"checkbox\" value=\"test\" />" +
      "<label for=\"f_method_for_test_test\">test</label></div></div>",
      multiple_select('f', 'method_for_test', ['test'])
    assert_dom_equal "<div class=\"test_class\"><div>" +
      "<input id=\"f_method_for_test_test\" name=\"f[method_for_test][]\" " +
      "type=\"checkbox\" value=\"test\" />" +
      "<label for=\"f_method_for_test_test\">test</label></div></div>",
      multiple_select('f', 'method_for_test', ['test'], :outer_class => 'test_class')
    assert_dom_equal "<div><div>" +
      "<input checked=\"checked\" id=\"f_method_for_test_selected_test\" name=\"f[method_for_test_selected][]\" " +
      "type=\"checkbox\" value=\"test\" />" +
      "<label for=\"f_method_for_test_selected_test\">test</label></div></div>",
      multiple_select('f', 'method_for_test_selected', ['test'])
    assert_dom_equal "<div></div>",
      multiple_select('f', 'method_for_test', [])
  end
  
  def test_cms
    Father.class_eval 'has_many :sons'
    Son.class_eval 'belongs_to :father'
    
    @f = Father.new
    @f.son_ids = []
    
    assert_dom_equal "<div><div>" +
      "<input id=\"f_son_ids_1\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"1\" />" +
      "<label for=\"f_son_ids_1\">Son 1</label></div>\n" +
      "<div><input id=\"f_son_ids_2\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"2\" />" +
      "<label for=\"f_son_ids_2\">Son 2</label></div>\n" +
      "<div><input id=\"f_son_ids_3\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"3\" />" +
      "<label for=\"f_son_ids_3\">Son 3</label></div>\n" +
      "<div><input id=\"f_son_ids_4\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"4\" />" +
      "<label for=\"f_son_ids_4\">Son 4</label></div>\n" +
      "<div><input id=\"f_son_ids_5\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"5\" />" +
      "<label for=\"f_son_ids_5\">Son 5</label></div>\n" +
      "<div><input id=\"f_son_ids_6\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"6\" />" +
      "<label for=\"f_son_ids_6\">Son 6</label></div>\n" +
      "<div><input id=\"f_son_ids_7\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"7\" />" +
      "<label for=\"f_son_ids_7\">Son 7</label></div></div>",
      collection_multiple_select('f', 'son_ids', Son.find(:all), :id, :name)
    
    assert_dom_equal "<div class=\"test_class\"><div>" +
      "<input id=\"f_son_ids_1\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"1\" />" +
      "<label for=\"f_son_ids_1\">Son 1</label></div>\n" +
      "<div><input id=\"f_son_ids_2\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"2\" />" +
      "<label for=\"f_son_ids_2\">Son 2</label></div>\n" +
      "<div><input id=\"f_son_ids_3\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"3\" />" +
      "<label for=\"f_son_ids_3\">Son 3</label></div>\n" +
      "<div><input id=\"f_son_ids_4\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"4\" />" +
      "<label for=\"f_son_ids_4\">Son 4</label></div>\n" +
      "<div><input id=\"f_son_ids_5\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"5\" />" +
      "<label for=\"f_son_ids_5\">Son 5</label></div>\n" +
      "<div><input id=\"f_son_ids_6\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"6\" />" +
      "<label for=\"f_son_ids_6\">Son 6</label></div>\n" +
      "<div><input id=\"f_son_ids_7\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"7\" />" +
      "<label for=\"f_son_ids_7\">Son 7</label></div></div>",
      collection_multiple_select('f', 'son_ids', Son.find(:all), :id, :name, :outer_class => 'test_class')
    
    @f.son_ids = [4, 5, 6]
    assert_dom_equal "<div><div>" +
      "<input id=\"f_son_ids_1\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"1\" />" +
      "<label for=\"f_son_ids_1\">Son 1</label></div>\n" +
      "<div><input id=\"f_son_ids_2\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"2\" />" +
      "<label for=\"f_son_ids_2\">Son 2</label></div>\n" +
      "<div><input id=\"f_son_ids_3\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"3\" />" +
      "<label for=\"f_son_ids_3\">Son 3</label></div>\n" +
      "<div><input checked=\"checked\" id=\"f_son_ids_4\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"4\" />" +
      "<label for=\"f_son_ids_4\">Son 4</label></div>\n" +
      "<div><input checked=\"checked\" id=\"f_son_ids_5\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"5\" />" +
      "<label for=\"f_son_ids_5\">Son 5</label></div>\n" +
      "<div><input checked=\"checked\" id=\"f_son_ids_6\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"6\" />" +
      "<label for=\"f_son_ids_6\">Son 6</label></div>\n" +
      "<div><input id=\"f_son_ids_7\" name=\"f[son_ids][]\" " +
      "type=\"checkbox\" value=\"7\" />" +
      "<label for=\"f_son_ids_7\">Son 7</label></div></div>",
      collection_multiple_select('f', 'son_ids', Son.find(:all), :id, :name)
     
     assert_dom_equal "<div></div>",
       collection_multiple_select('f', 'son_ids', [], :id, :name)
  end
  
  def test_tms
    @n = Node.new
    assert_dom_equal "<div><div>" +
      "<input id=\"n_selected_none_11\" name=\"n[selected_none][]\" " +
      "type=\"checkbox\" value=\"11\" />" +
      "<label for=\"n_selected_none_11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"n_selected_none_12\" name=\"n[selected_none][]\" " +
      "type=\"checkbox\" value=\"12\" />" +
      "<label for=\"n_selected_none_12\">Node 3.2.2</label></div>",
      tree_multiple_select('n', 'selected_none', nodes(:n32).children, :id, :name)
    assert_dom_equal "<div class=\"test_class\"><div>" +
      "<input id=\"n_selected_none_11\" name=\"n[selected_none][]\" " +
      "type=\"checkbox\" value=\"11\" />" +
      "<label for=\"n_selected_none_11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"n_selected_none_12\" name=\"n[selected_none][]\" " +
      "type=\"checkbox\" value=\"12\" />" +
      "<label for=\"n_selected_none_12\">Node 3.2.2</label></div>",
      tree_multiple_select('n', 'selected_none', nodes(:n32).children, :id, :name, :outer_class => 'test_class')
    assert_dom_equal "<div><div>" +
      "<input id=\"n_selected_some_11\" name=\"n[selected_some][]\" " +
      "type=\"checkbox\" value=\"11\" />" +
      "<label for=\"n_selected_some_11\">Node 3.2.1</label></div>\n" +
      "<div><input checked=\"checked\" id=\"n_selected_some_12\" name=\"n[selected_some][]\" " +
      "type=\"checkbox\" value=\"12\" />" +
      "<label for=\"n_selected_some_12\">Node 3.2.2</label></div></div>",
      tree_multiple_select('n', 'selected_some', nodes(:n32).children, :id, :name)
    assert_dom_equal "<div></div>",
      tree_multiple_select('n', 'selected_some', nodes(:n33).children, :id, :name)
  end
    
  def test_cftfms
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name)
  end
  
  def test_cftfms_depth
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :depth => 1)
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :depth => 2)
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :depth => 0)
  end
  
  def test_cftfms_inner_class
    assert_dom_equal "<div class=\"testclass\">" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"testclass\">" +
      "<input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div class=\"testclass\">" +
      "<input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"testclass\">" +
      "<input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div class=\"testclass\">" +
      "<input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :inner_class => 'testclass')
  end
  
  def test_cftfms_level_class
    assert_dom_equal "<div class=\"level0\">" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"level0\"><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div class=\"level1\"><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"level1\"><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div class=\"level0\"><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :level_class => 'level')
    assert_dom_equal "<div class=\"testclass level0\">" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"testclass level0\">" +
      "<input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div class=\"testclass level1\">" +
      "<input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"testclass level1\">" +
      "<input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div class=\"testclass level0\">" +
      "<input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :level_class => 'level', :inner_class => 'testclass')
    assert_dom_equal "<div class=\"level2\">" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"level2\"><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div class=\"level3\"><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"level3\"><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div class=\"level2\"><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :level_class => 'level', :initial_level => 2)
  end
  
  def test_cftfms_child_method
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :child_method => :alt_children)
  end
  
  def test_cftfms_alternate
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"alt\"><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"alt\"><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :alternate => true)
    assert_dom_equal "<div>" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div class=\"alt\"><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div class=\"alt\"><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :alternate => true, :initial_alternate => false)
    assert_dom_equal "<div class=\"alt\">" +
      "<input id=\"name8\" name=\"name[]\" type=\"checkbox\" value=\"8\" />" +
      "<label for=\"name8\">Node 3.1</label></div>\n" +
      "<div><input id=\"name9\" name=\"name[]\" type=\"checkbox\" value=\"9\" />" +
      "<label for=\"name9\">Node 3.2</label></div>\n" +
      "<div class=\"alt\"><input id=\"name11\" name=\"name[]\" type=\"checkbox\" value=\"11\" />" +
      "<label for=\"name11\">Node 3.2.1</label></div>\n" +
      "<div><input id=\"name12\" name=\"name[]\" type=\"checkbox\" value=\"12\" />" +
      "<label for=\"name12\">Node 3.2.2</label></div>\n" +
      "<div class=\"alt\"><input id=\"name10\" name=\"name[]\" type=\"checkbox\" value=\"10\" />" +
      "<label for=\"name10\">Node 3.3</label></div>",
      checkboxes_from_tree_for_multiple_select('name', nodes(:n3).children, :id, :name, [], :alternate => true, :initial_alternate => true)
  end
end
