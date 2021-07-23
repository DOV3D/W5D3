class PolyTreeNode

    attr_reader :parent, :children, :value 

    def initialize(value)
        @value = value
        @parent = nil 
        @children = [] 
    end 

    def parent=(node=nil)
        if @parent != nil 
            @parent.children.delete(self)
        end 
        
        @parent = node


        if node != nil 
            node.children << self 
        end  
        

    end 


    



end