class Node

    attr_accessor :data, :parent, :left, :right

    def initialize data=nil, parent=nil, left=nil, right=nil
        @data = data
        @parent = parent
        @left = left
        @right = right
    end

end

def build_tree arr
    # assuming input array is not sorted
    # assuming input is all numbers

    # initialize tree with first value from array
    tree = Node.new(arr.shift)

    arr.each do |data|

        # initialize with root node
        node = tree

        # run loop indefinitely until broken by conditions defined within
        until false
            if data < node.data
                # check whether there exists a left child node
                if node.left == nil
                    # if no left child node exists, create one and break the loop
                    node.left = Node.new(data, node)
                    break
                else
                    # if left child node exists, move curser to node and compare values again
                    node = node.left
                end
            else
                # check whether there exists a right child node
                if node.right == nil
                    # if no right child node exists, create one and break the loop
                    node.right = Node.new(data, node)
                    break
                else
                    # if right child node exists, move curser to node and compare values again
                    node = node.right
                end
            end
        end
    end

    return tree

end

# def build_tree arr, parent=nil
#     # assuming the array has been sorted the midpoint of the array is used as root
#     root_index = arr.size/2
#     root = arr[root_index]
#     left = arr[0...root_index]
#     right = arr[(root_index + 1)...arr.size]
#     if arr.size < 1
#         return nil
#     elsif arr.size == 1
#         return Node.new(root, parent, nil, nil)
#     else
#         node = Node.new(root, parent)
#         node.left = build_tree(left, node)
#         node.right = build_tree(right, node)
#         return node
#     end
# end

def breadth_first_search value, tree

    # initialize queue with root of tree
    queue = [tree]

    until queue.empty?
        
        # extract first node from queue
        node = queue.shift
        
        # add children of current node to queue if they exist
        queue.push node.left if node.left
        queue.push node.right if node.right

        # read node data and check against value
        if node.data == value
            return node
        end
    
    end

    return "We ain't found shit"

end

def depth_first_search value, tree
    
    # initialize cursor with root of tree
    stack = [tree]
    node = stack.first

    # keep a list of processed nodes (to prevent adding them more than once)
    processed = [node]

    # in-order depth-first search
    until stack.empty?
        if node.left && !processed.include?(node.left)
            # if left child exists, add to stack
            stack.push node.left
            # add left child to processed array to prevent repeats
            processed.push node.left
        elsif node.data == value
            return node
        elsif node.right && !processed.include?(node.right)
            # if right child exists, add to stack
            stack.push node.right
            # add right child to processed array to prevent repeats
            processed.push node.right
        else
            # remove node from top of stack once fully processed
            stack.pop
        end
        # move cursor to top of stack
        node = stack.last
    end

    return "We ain't found shit"

end

def dfs_rec value, node, solution=nil

    # base case
    return nil if node.nil? && solution.nil?

    # check left child node
    solution = dfs_rec(value, node.left, solution) if node.left

    # read data on current node
    return node if node.data == value

    # check right child node
    solution = dfs_rec(value, node.right, solution) if node.right

    return solution.nil? ? "We ain't found shit" : solution
    
end

arr = [1, 2, 3, 4, 5, 6, 7, 8, 9].shuffle
arr_string = ["hello", "goodbye", "one", "two", "test", "cat", "dog"].shuffle