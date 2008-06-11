module Liquid
  
  class Block
    attr_accessor :nodelist
    
    def initialize(markup, tokens)
      @markup = markup
      parse(tokens)
    end
   
    def parse(tokens)
      @nodelist ||= []
      @nodelist.clear
                                                
      while token = tokens.shift 
        
        case token
        when /^#{BlockStartTag}/                   
          if token =~ /^#{BlockStartTag}\s*(\w+)\s*(.*)?#{BlockEndTag}$/
                                                                                                           
            # if we found the proper block delimitor just end parsing here and let the outer block
            # proceed                               
            return if block_delimiter.include?($1)  
            
            # fetch the block from registered blocks
            if block = Template.blocks[$1]
              @nodelist << block.new($2, tokens)
            else
              # this tag is not registered with the system 
              # pass it to the current block for special handling or error reporting
              unknown_tag($1, $2, tokens)
            end              
          else
            raise SyntaxError.new("Tag '#{token}' was not properly terminated with #{BlockEndTag} ")
          end
        when /^#{VariableStartTag}/
          @nodelist << create_variable(token)
        when ''
          # pass
        else
          @nodelist << token
        end
      end       
           
      # Make sure that its ok to end parsing in the current block. 
      # Effectively this method will throw and exception unless the current block is 
      # of type Document 
      assert_missing_delimitation!
    end                     
        
    def unknown_tag(tag, params, tokens)
      case tag 
      when 'else'
        raise SyntaxError.new("#{block_name} tag does not expect else tag")
      when 'end'
        raise SyntaxError.new("'end' is not a valid delimiter for #{block_name} tags. use #{block_delimiter}")
      else
        raise SyntaxError.new("Unknown tag '#{tag}'")      
      end
    end
    
    def block_delimiter
      ["end#{block_name}"]
    end                           
    
    def block_name
      self.class.name.scan(/\w+$/).first.downcase
    end
    
    def assert_missing_delimitation!
      raise SyntaxError.new("#{block_name} tag was never closed")
    end
    
    def create_tag(token, tokens)
    end
    
    def create_variable(token)
      token.scan(/^#{VariableStartTag}(.*)#{VariableEndTag}$/) do |content|
        return Variable.new(content.first)
      end
      raise SyntaxError.new("Variable '#{token}' was not properly terminated with #{VariableEndTag} ")
    end
    
    def render(context)
      render_all(@nodelist, context)
    end
    
    protected
    
    def render_all(list, context)
      list.collect do |token|
        if token.respond_to?(:render)
          token.render(context)
        else
          token.to_s
        end
      end      
    end
  end
end
   