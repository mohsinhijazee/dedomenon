module Liquid
  
  class ContextError < StandardError
  end
  
  # Context keeps the variable stack and resolves variables, as well as keywords
  #
  #   context['variable'] = 'testing'
  #   context['variable'] #=> 'testing'
  #   context['true']     #=> true
  #   context['10.2232']  #=> 10.2232
  #   
  #   context.stack do 
  #      context['bob'] = 'bobsen'
  #   end
  #
  #   context['bob']  #=> nil  class Context
  class Context
    attr_reader :assigns
  
    def initialize(assigns = {})
      @assigns = [assigns]
    end                            
           
    def filters
      @filters ||= Template.filters.clone
    end
           
    # adds filters to this context. 
    # this does not register the filters with the main Template object. see <tt>Template.register_filters</tt> 
    # for that
    def add_filters(filter)
      filters.extend(filter)
    end
                              
    def invoke(method, *args)
      filters.send(method, *args)
    end    
  
    # push new local scope on the stack. use <tt>Context#stack</tt> instead
    def push
      @assigns.unshift({})
    end
    
    # merge a hash of variables in the current local scope
    def merge(new_assigns)
      @assigns[0].merge(new_assigns)
    end
  
    # pop from the stack. use <tt>Context#stack</tt> instead
    def pop
      raise ContextError if @assigns.size == 1 
      @assigns.shift
    end
    
    # pushes a new local scope on the stack, pops it at the end of the block
    #
    # Example:
    #
    #   context.stack do 
    #      context['var'] = 'hi'
    #   end
    #   context['var]  #=> nil
    #
    def stack(&block)
      push
      begin
        result = yield
      ensure 
        pop
      end
      result      
    end
  
    # Only allow String, Numeric, Hash, Array or <tt>Liquid::Drop</tt>
    def []=(key, value)
      @assigns[0][key] = value
    end
  
    def [](key)
      resolve(key)
    end
  
    def has_key?(key)
      resolve(key) != nil
    end
    
    private
    
    # Look up variable, either resolve directly after considering the name. We can directly handle 
    # Strings, digits, floats and booleans (true,false). If no match is made we lookup the variable in the current scope and 
    # later move up to the parent blocks to see if we can resolve the variable somewhere up the tree.
    # Some special keywords return symbols. Those symbols are to be called on the rhs object in expressions
    #
    # Example: 
    #
    #   products == empty #=> products.empty?
    #
    def resolve(key)    
      case key 
      when 'true'
        true
      when 'false'
        false
      when 'empty'
        :empty?
      when 'nil', 'null'
        :nil?
      # Integer and floats
      when /^(\d+)$/ 
        $1.to_i
      when /^(\d[\d\.]+)$/ 
        $1.to_f
      # Single quoted strings
      when /^'(.*)'$/
        $1.to_s
      # Double quoted strings
      when /^"(.*)"$/
        $1.to_s
      else
        variable(key)
      end
    end
    
    # fetches an object starting at the local scope and then moving up 
    # the hierachy 
    def fetch(key)
      for assigns in @assigns
        return assigns[key] if assigns.has_key?(key)
      end
      nil
    end

    # resolves namespaced queries gracefully.
    # 
    # Example
    # 
    #  @context['hash'] = {"name" => 'tobi'}
    #  assert_equal 'tobi', @context['hash.name']
    def variable(key)                  
      parts = key.split(VariableAttributeSeparator)
      if object = fetch(parts.shift)
        while parts.size > 0
          next_part = parts.shift        
          return nil if not object.respond_to?(:has_key?)
          return nil if not object.has_key?(next_part)
          object = object[next_part]
        end
        return object
      end
      nil
    end                                   
    
  end
end