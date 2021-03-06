require "byebug"

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

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "Node is not a child!" if !@children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        # debugger
        return self if self.value == target_value

        @children.each do |child|
            result = child.dfs(target_value)
            if result != nil
                return result
            end
        end
        nil
    end

    def bfs(target_value) #d
        new_a = []
        new_a.push(self) 
        until new_a.empty?
            shifted_node = new_a.shift # c
            if shifted_node.value == target_value
                return shifted_node
            else
                new_a += shifted_node.children
            end
        end
        nil
    end

    # def find_all_parents  # a => b => c => d
    #     return [self] if self.parent.nil?

    #     return self.parent.find_all_parents + [self]

    #     # return an array of nodes (starting from root, ending with self)
    # end

    def inspect
        self.value
    end

end

a = PolyTreeNode.new("a")
b = PolyTreeNode.new("b")
c = PolyTreeNode.new("c")
d = PolyTreeNode.new("d")
e = PolyTreeNode.new("e")

e.parent = b
d.parent = c
c.parent = b
b.parent = a

#d.find_all_parents