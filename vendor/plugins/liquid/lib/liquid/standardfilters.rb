module Liquid
  
  module StandardFilters
    
    def size(input,*args)
      input.size
    end         

    def downcase(input,*args)
      input.downcase
    end         

    def upcase(input,*args)
      input.upcase
    end         
    
  end
   
  Template.register_filter(StandardFilters)
end