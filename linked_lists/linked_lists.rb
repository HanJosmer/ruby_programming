class Node
    
    attr_accessor :value, :next_node
    
    def initialize value=nil, next_node=nil
        @value = value
        @next_node = next_node
    end

end

class LinkedList

    def initialize
        @head_node = nil
        @tail_node = nil
    end

    def append value, node=@head_node
        if @head_node == nil
            @head_node = Node.new(value)
            @tail_node = @head_node
        else
            until node.next_node == nil
                node = node.next_node
            end
            node.next_node = Node.new(value)
            @tail_node = node.next_node
        end
    end
    
    def list
        return @head_node
    end

    def prepend value, node=@head_node
        if @head_node == nil
            @head_node = Node.new(value)
            @tail_node = @head_node
        else
            @head_node = Node.new(value, node)
            @tail_node = @head_node
        end
    end

    def size node=@head_node
        if node == nil
            return 0
        else
            i = 1
            until node.next_node == nil
                i += 1
                node = node.next_node
            end
            return i
        end
    end

    def head
        @head_node
    end

    def tail
        @tail_node
    end

    def at index
        # Currently index base zero.  This may change.
        if index >= self.size || index < 0
            return "Index out of range"
        else
            node = @head_node
            index.times do
                node = node.next_node
            end
            return node
        end
    end

    def pop
        # Pops off the first element of the list and returns it
        if @head_node == nil
            return "Cannot pop non-existent element"
        else
            node = @head_node
            @head_node = node.next_node
            return node
        end
    end

    def contains? value
        unless @head_node == nil
            node = @head_node
            self.size.times do
                if node.value == value
                    return true
                else
                    node = node.next_node
                end
            end
            return false
        else
            return false
        end
    end

    def find data
        unless @head_node == nil
            node = @head_node
            self.size.times do |index|
                if node.value == data
                    return (index + 1)
                else
                    node = node.next_node
                end
            end
            return false
        else
            return false
        end
    end
    
    def to_s
        string = ""
        if self.size <= 0
            return string
        else
            node = @head_node
            self.size.times do
                string += node.value.to_s + " --> "
                node = node.next_node
            end
            return string
        end
    end

    #### Bonus ####

    def insert_at index, value=nil
        if index < 0 || index >= self.size
            return "Index out of range"
        elsif index == 0
            self.prepend value
        else
            node = @head_node
            (index - 1).times do
                node = node.next_node
            end
            node.next_node = Node.new(value, node.next_node)
        end
    end

    def remove_at index
        if index < 0 || index >= self.size
            return "Index out of range"
        elsif index == 0
            self.pop
        else
            node = @head_node
            (index - 1).times do
                node = node.next_node
            end
            # Move the link to the next node, effectively removing the node at provided index
            node.next_node = node.next_node.next_node
        end
    end
    
end