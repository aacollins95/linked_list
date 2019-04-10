class LinkedList
  attr_reader :head, :tail
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
      puts "'append' failed"
      puts "need data of type #{@type}"
    end
  end

  def prepend(data)
    if data.is_a? @type
      new = Node.new(data,@head)
      @head = new
    else
      puts "'prepend' failed"
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

  def at(index)
    if index < self.size && index >= 0 && index.is_a?(@type)
      count = 0
      at = nil
      curr_node = @head
      while count <= index
        at = curr_node if count == index
        curr_node = curr_node.next_node
        count += 1
      end
    else
      puts "'at' failed"
      puts "index needs to be in Linked List of size #{self.size}"
    end
    return at
  end

  def pop
    #remove last item from LL
    node_i = @head
    while node_i.next_node.next_node != @tail do node_i = node_i.next_node end
    data = node_i.next_node.data
    node_i.next_node = @tail
    return data
  end

  def contains?(data)
    #returns true if the given data is in the LL
    if data.is_a?(@type)
      data_found = false
      curr_node = @head
      while curr_node != @last
        data_found = true if data == curr_node.data
        curr_node = curr_node.next_node
      end
    else
      puts "'contains?' failed"
      puts "need data of type #{@type}"
    end
    return data_found
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

7.times do list.pop end
puts "LL of size #{list.size}"
list.disp

puts list.contains?(3)
