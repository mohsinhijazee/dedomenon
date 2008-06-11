require File.dirname(__FILE__) + '/test_helper'

class TemplateTest < Test::Unit::TestCase
  include Liquid
  
  def test_no_transform
    assert_template_result('this text should come out of the template without change...',
                           'this text should come out of the template without change...')
    assert_template_result('blah','blah')
    assert_template_result('<blah>','<blah>')
    assert_template_result('|,.:','|,.:')
    assert_template_result('','')
    
    text = %|this shouldnt see any transformation either but has multiple lines
              as you can clearly see here ...|
    assert_template_result(text,text)
  end
  
  def test_has_a_block_which_does_nothing
    assert_template_result(%|the comment block should be removed  .. right?|,
                           %|the comment block should be removed {%comment%} be gone.. {%endcomment%} .. right?|)
    
    assert_template_result('','{%comment%}{%endcomment%}')
    assert_template_result('','{%comment%}{% endcomment %}')
    assert_template_result('','{% comment %}{%endcomment%}')
    assert_template_result('','{% comment %}{% endcomment %}')
    assert_template_result('','{%comment%}comment{%endcomment%}')
    assert_template_result('','{% comment %}comment{% endcomment %}')
    
    assert_template_result('foobar','foo{%comment%}comment{%endcomment%}bar')
    assert_template_result('foobar','foo{% comment %}comment{% endcomment %}bar')
    assert_template_result('foobar','foo{%comment%} comment {%endcomment%}bar')
    assert_template_result('foobar','foo{% comment %} comment {% endcomment %}bar')
    
    assert_template_result('foo  bar','foo {%comment%} {%endcomment%} bar')
    assert_template_result('foo  bar','foo {%comment%}comment{%endcomment%} bar')
    assert_template_result('foo  bar','foo {%comment%} comment {%endcomment%} bar')
    
    assert_template_result('foobar','foo{%comment%}
                                     {%endcomment%}bar')
  end

  def test_for
    assert_template_result(' yo  yo  yo  yo ','{%for item in array%} yo {%endfor%}','array' => [1,2,3,4])
    assert_template_result('yoyo','{%for item in array%}yo{%endfor%}','array' => [1,2])
    assert_template_result(' yo ','{%for item in array%} yo {%endfor%}','array' => [1])
    assert_template_result('','{%for item in array%}{%endfor%}','array' => [1,2])
    expected = <<HERE
  
  yo
  
  yo
  
  yo
  
HERE
    template = <<HERE
{%for item in array%}  
  yo
{%endfor%}  
HERE
    assert_template_result(expected,template,'array' => [1,2,3])
  end

  def test_for_with_variable
    assert_template_result(' 1  2  3 ','{%for item in array%} {{item}} {%endfor%}','array' => [1,2,3])
    assert_template_result('123','{%for item in array%}{{item}}{%endfor%}','array' => [1,2,3])
    assert_template_result('123','{% for item in array %}{{item}}{% endfor %}','array' => [1,2,3])
    assert_template_result('abcd','{%for item in array%}{{item}}{%endfor%}','array' => ['a','b','c','d'])
    assert_template_result('a b c','{%for item in array%}{{item}}{%endfor%}','array' => ['a',' ','b',' ','c'])
    assert_template_result('abc','{%for item in array%}{{item}}{%endfor%}','array' => ['a','','b','','c'])
  end
  
  def test_for_helpers
    assigns = {'array' => [1,2,3] }
    assert_template_result(' 1/3  2/3  3/3 ','{%for item in array%} {{forloop.index}}/{{forloop.length}} {%endfor%}',assigns)
    assert_template_result(' 1  2  3 ','{%for item in array%} {{forloop.index}} {%endfor%}',assigns)
    assert_template_result(' 0  1  2 ','{%for item in array%} {{forloop.index0}} {%endfor%}',assigns)
    assert_template_result(' 2  1  0 ','{%for item in array%} {{forloop.rindex0}} {%endfor%}',assigns)
    assert_template_result(' 3  2  1 ','{%for item in array%} {{forloop.rindex}} {%endfor%}',assigns)
    assert_template_result(' true  false  false ','{%for item in array%} {{forloop.first}} {%endfor%}',assigns)
    assert_template_result(' false  false  true ','{%for item in array%} {{forloop.last}} {%endfor%}',assigns)
  end
  
  def test_for_and_if
    assigns = {'array' => [1,2,3] }
    assert_template_result(' yay     ',
                           '{%for item in array%} {% if forloop.first %}yay{% endif %} {%endfor%}',
                           assigns)
    assert_template_result(' yay  boo  boo ',
                          '{%for item in array%} {% if forloop.first %}yay{% else %}boo{% endif %} {%endfor%}',
                          assigns)
    assert_template_result('   boo  boo ',
                          '{%for item in array%} {% if forloop.first %}{% else %}boo{% endif %} {%endfor%}',
                          assigns)
  end
  
  def test_nested_for
    assigns = {'array' => [[1,2],[3,4],[5,6]] }
    assert_template_result('123456','{%for item in array%}{%for i in item%}{{ i }}{%endfor%}{%endfor%}',assigns)
  end
  
end
