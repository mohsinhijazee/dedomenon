module Liquid 
    
  class Comment < Block                                             
    def render(context)
      ""
    end    
  end

  class For < Block                                             
    Syntax = /(\w+)\s+in\s+(#{AllowedVariableCharacters}+)/   
    
    def initialize(markup, tokens)
      super

      if markup =~ Syntax
        @variable_name = $1
        @collection_name = $2
      else
        raise SyntaxError.new("Syntax Error in 'for loop' - Valid syntax: for [item] in [collection]")
      end
    end
    
    def render(context)        
      collection = context[@collection_name] or raise ArgumentError.new("Error in 'for loop' - '#{@collection_name}' does not exist.")      
      length = collection.length

      result = []

      context.stack do 

        collection.each_with_index do |item, index|
          context[@variable_name] = item
          context['forloop'] = {
            'length'  => length,
            'index'   => index + 1, 
            'index0'  => index, 
            'rindex'  => length - index,
            'rindex0' => length - index -1,
            'first'   => (index == 0),
            'last'    => (index == length - 1) }
          
          result << render_all(@nodelist, context)
          
        end
      end
      result 
    end    
  end
  
  class If < Block
    Syntax = /(#{QuotedFragment})\s*([=!<>]+)?\s*(#{QuotedFragment})?/
    
    def initialize(markup, tokens)
      @nodelist_true = @nodelist = []
      @nodelist_false = []

      super
                       
      if markup =~ Syntax
        @left = $1
        @operator = $2 
        @right = $3
      else
        raise SyntaxError.new("Syntax Error in tag 'if' - Valid syntax: if [condition]")
      end
      
    end
    
    def unknown_tag(tag, params, tokens)
      if tag == 'else'
        @nodelist = @nodelist_false = []
      else
        super
      end
    end
    
    def render(context)
      context.stack do       
        if interpret_condition(@left, @right, @operator, context)
          render_all(@nodelist_true, context)
        else
          render_all(@nodelist_false, context)
        end
      end
    end
    
    def equal_variables(right, left)

      if left.is_a?(Symbol)
        if right.respond_to?(left.to_s)
          return right.send(left.to_s) 
        else
          raise ArgumentError.new("Error in tag 'if' - Cannot call method #{left} on type #{right.class}}")
        end
      end

      if right.is_a?(Symbol)
        if left.respond_to?(right.to_s)
          return left.send(right.to_s) 
        else
          raise ArgumentError.new("Error in tag 'if' - Cannot call method #{right} on type #{left.class}}")
        end
      end
      
      left == right      
    end    

    def interpret_condition(left, right, op, context)
      case op
      when '=='
        equal_variables(context[left], context[right])
      when '!='
        !equal_variables(context[left], context[right])
      when '>'
        context[left] > context[right]
      when '>='
        context[left] >= context[right]
      when '<'
        context[left] < context[right]
      when '<='
        context[left] <= context[right]
      when nil
        context[left]
      else
        raise ArgumentError.new("Error in tag 'if' - Unknown operator #{op}")
      end 
    end   
    
  end
  
  Template.register_block('comment', Comment)
  Template.register_block('for', For)
  Template.register_block('if', If)
end 