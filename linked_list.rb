class LinkedList
  def initialize(data)
    #tail always points to a dummy node
    @tail = Node.new
    @head = Node.new(data,@tail)
    @type = Integer
  end

  def disp
    curr_node = @head
    while curr_node != @tail
      puts curr_node.data
      curr_node = curr_node.next_node
    end
  end

  def append(data)
    if data.is_a? @type
      @tail.next_node = Node.new
      @tail.data = data
      @tail = @tail.next_node
    else
      puts "need data of type #{@type}"
    end
  end



end

class Node
  attr_accessor :next_node,:data

  def initialize(data=nil,next_node=nil)
    @data = data
    @next_node = next_node
  end
end

list = LinkedList.new(0)
(1..10).each do |i| list.append(i) end
list.disp
