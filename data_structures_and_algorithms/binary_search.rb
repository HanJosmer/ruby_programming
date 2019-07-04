class Node

    attr_accessor :data, :parent, :left, :right

    def initialize data=nil, parent=nil, left=nil, right=nil
        @data = data
        @parent = parent
        @left = left
        @right = right
    end

    

end