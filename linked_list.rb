class LinkedList
  def initialize(data)
    #tail always points to a dummy node
    @tail = Node.new
    @head = Node.new(data,@tail)
    @type = Integer
  end

  def disp
    #quickdirty method to display the LL
    curr_node = @head
    while curr_node != @tail
      puts curr_node.data
      curr_node = curr_node.next_node
    end
  end

  def append(data)
    #adds a data to the end of the LL
    if data.is_a? @type
      @tail.next_node = Node.new
      @tail.data = data
      @tail = @tail.next_node
    else
      puts "need data of type #{@type}"
    end
  end

  def prepend(data)
    if data.is_a? @type
      new = Node.new(data,@head)
      @head = new
    else
      puts "need data of type #{@type}"
    end
  end

  def size
    #gets length of LL
    curr_node = @head
    size = 0
    while curr_node != @tail
      size += 1
      curr_node = curr_node.next_node
    end
    return size
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
(11..20).each do |i| list.prepend(i) end
puts "LL of size #{list.size}"
list.disp
