require File.dirname(__FILE__) + '/test_helper'

class ContextTest < Test::Unit::TestCase
  include Liquid

  def setup
    @context = Liquid::Context.new
  end

  def test_variables
    @context['test'] = 'test'
    assert_equal 'test', @context['test']
  end

  def test_variables_not_existing
    assert_equal nil, @context['test']
  end
  
  def test_scoping
    assert_nothing_raised do
      @context.push
      @context.pop
    end
    
    assert_raise(Liquid::ContextError) do
      @context.pop
    end    
  end
  
  def test_add_filter
    
    filter = Module.new do 
      def hi(output)
        output + ' hi!'
      end
    end
    
    context = Context.new 
    context.add_filters(filter)
    assert_equal 'hi? hi!', context.invoke(:hi, 'hi?')
    
    context = Context.new 
    assert_raise(NoMethodError) do 
      assert_equal 'hi? hi!', context.invoke(:hi, 'hi?')
    end
    context.add_filters(filter)
    assert_equal 'hi? hi!', context.invoke(:hi, 'hi?')
        
  end
  
  def test_add_item_in_outer_scope
    @context['test'] = 'test'
    @context.push
    assert_equal 'test', @context['test']
    @context.pop    
    assert_equal 'test', @context['test']    
  end

  def test_add_item_in_inner_scope
    @context.push
    @context['test'] = 'test'
    assert_equal 'test', @context['test']
    @context.pop    
    assert_equal nil, @context['test']    
  end
  
  def test_hierachical_data
    @context['hash'] = {"name" => 'tobi'}
    assert_equal 'tobi', @context['hash.name']
  end
  
  def test_keywords
    assert_equal true, @context['true']
    assert_equal false, @context['false']
  end

  def test_digits
    assert_equal 100, @context['100']
    assert_equal 100.00, @context['100.00']
  end
  
  def test_strings
    assert_equal "hello!", @context['"hello!"']
    assert_equal "hello!", @context["'hello!'"]
  end  
end