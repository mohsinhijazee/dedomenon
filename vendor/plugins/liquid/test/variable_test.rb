#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/test_helper'

class VariableTest < Test::Unit::TestCase
  include Liquid

  def test_variable
    var = Variable.new('hello')
    assert_equal 'hello', var.name
  end

  def test_filters
    var = Variable.new('hello | textileze')
    assert_equal 'hello', var.name
    assert_equal [[:textileze,[]]], var.filters

    var = Variable.new('hello | textileze | paragraph')
    assert_equal 'hello', var.name
    assert_equal [[:textileze,[]], [:paragraph,[]]], var.filters

    var = Variable.new(%! hello | strftime: '%Y'!)
    assert_equal 'hello', var.name
    assert_equal [[:strftime,["'%Y'"]]], var.filters

    var = Variable.new(%! 'typo' | link_to: 'Typo', true !)
    assert_equal %!'typo'!, var.name
    assert_equal [[:link_to,["'Typo'", "true"]]], var.filters
    
    var = Variable.new(%! 'typo' | link_to: 'Typo', false !)
    assert_equal %!'typo'!, var.name
    assert_equal [[:link_to,["'Typo'", "false"]]], var.filters
    
    var = Variable.new(%! 'foo' | repeat: 3 !)
    assert_equal %!'foo'!, var.name
    assert_equal [[:repeat,["3"]]], var.filters
    
    var = Variable.new(%! 'foo' | repeat: 3, 3 !)
    assert_equal %!'foo'!, var.name
    assert_equal [[:repeat,["3","3"]]], var.filters

    var = Variable.new(%! 'foo' | repeat: 3, 3, 3 !)
    assert_equal %!'foo'!, var.name
    assert_equal [[:repeat,["3","3","3"]]], var.filters

    var = Variable.new(%! hello | strftime: '%Y, okay?'!)
    assert_equal 'hello', var.name
    assert_equal [[:strftime,["'%Y, okay?'"]]], var.filters
  
    var = Variable.new(%! hello | things: "%Y, okay?", 'the other one'!)
    assert_equal 'hello', var.name
    assert_equal [[:things,["\"%Y, okay?\"","'the other one'"]]], var.filters
  end

  def test_string_single_quoted
    var = Variable.new(%| "hello" |)
    assert_equal '"hello"', var.name
  end

  def test_string_double_quoted
    var = Variable.new(%| 'hello' |)
    assert_equal "'hello'", var.name
  end
  
  def test_integer
    var = Variable.new(%| 1000 |)
    assert_equal "1000", var.name
  end

  def test_float
    var = Variable.new(%| 1000.01 |)
    assert_equal "1000.01", var.name
  end
  
  def test_string_with_special_chars
    var = Variable.new(%| 'hello! $!@.;"ddasd" ' |)
    assert_equal %|'hello! $!@.;"ddasd" '|, var.name
  end

  def test_string_dot
    var = Variable.new(%| test.test |)
    assert_equal 'test.test', var.name
  end
end


class VariableResolutionTest < Test::Unit::TestCase
  include Liquid
  
  def test_simple_variable    
    template = Template.parse(%|{{test}}|)
    assert_equal 'worked', template.render('test' => 'worked')
    assert_equal 'worked wonderfully', template.render('test' => 'worked wonderfully')
  end

  def test_simple_with_whitespaces    
    template = Template.parse(%|  {{ test }}  |)
    assert_equal '  worked  ', template.render('test' => 'worked')
    assert_equal '  worked wonderfully  ', template.render('test' => 'worked wonderfully')
  end

  def test_ignore_unknown
    template = Template.parse(%|{{ test }}|)
    assert_equal '', template.render
  end

  def test_hash_scoping
    template = Template.parse(%|{{ test.test }}|)
    assert_equal 'worked', template.render('test' => {'test' => 'worked'})
  end

end

class VariableWithFiltersTest < Test::Unit::TestCase
  include Liquid
  
  module Filters
    def money(input)
      sprintf(' %d$ ', input)
    end
  end
  
  def test_local_filter
    context = Context.new
    context['var'] = 1000
    context.add_filters(Filters)
    
    assert_equal ' 1000$ ', Variable.new("var | money").render(context)
  end

  def test_global_filter                                                             
    context = Context.new
    context['var'] = 1000
    
    assert_equal 4, Variable.new("var | size").render(context)
  end

end