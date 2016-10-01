
class LinkedList
	attr_accessor :head, :tail

	def initialize 
		@head = nil
		@tail = nil
		@size = 0 #to keep track of the size of the list.
		run
	end

	def run #User Prompt
		@node_value = @head
		puts "Options:"
		puts "0. Append to the list."
		puts "1. Prepend to the list."
		puts "2. Size of the list."
		puts "3. Head of the list."
		puts "4. Tail of the list."
		puts "5. Value given an index."
		puts "6. Remove the last element in the list."
		puts "7. Check if the list contains a value."
		puts "8. Return the index of a value."
		puts "9. Print the list. "
		puts "'put' for insert at a given index."
		puts "'del' to delete at a given index."
		puts "[Type 'e' to Exit]"
		print "Choose from the menu: "
		task = gets.chomp.downcase
		perform(task)
	end

	def perform(task) #Call THE method according to the desired task.
		case task
		when '0'
			value = node_entry
			append(value)

		when '1'
			value = node_entry
			prepend(value)

		when '2'
			size

		when '3'
			head

		when '4'
			tail

		when '5'
			if @head.nil?
				puts "List is empty..."
				run
			end
			begin
			print "Type the index number: "
			indx = Integer(gets) rescue nil
			puts "Input must be numeric..." if indx.nil?
			end while indx.nil?
			at(indx)

		when '6'
			puts "Deleting last element..." unless @head.nil?
			if @size == 1
				@head = nil
				@tail = nil
				@size = 0
				puts "There are no more elements in the list."
				run
			else
				pop
			end

		when '7'
			print "Type the element to check: "
			val = gets.strip
			contains?(val)

		when '8'
			print "Type the value you are looking for: "
			data = gets.strip
			find(data)

		when '9'
			to_console

		when 'put'
			value = node_entry
			begin
			print "Type the numeric index for placement: "
			index = Integer(gets) rescue nil
			end while index.nil?
			if index >= @size
				puts "Index out of range..."
				run
			end
			insert_at(value, index)

		when 'del'
			begin
				print "Type the index of the value to be deleted: "
				index = Integer(gets) rescue nil
			end while index.nil?
			remove_at(index)

		when 'e'
			exit
		else
			puts "Invalid option, try again..."
			run
		end
	end

	def node_entry #Creates new element/node to be added.
		print "Type the data to store: "
		data = gets.strip
		node = Node.new(data)
		return node
	end

	def append(node)
		if @head.nil?
			@head = node
			@tail = node
			@size += 1
		else
			node.next_node = @head
			@head = node
			@size += 1
		end
		run
	end

	def prepend(node)
		if @head.nil?
			puts "The list is empty, creating..."
			append(node)
		else
			@tail.next_node = node
			@tail = node
			@size += 1
		end
		run
	end

	def size
		puts "The size of the list is: #{@size}"
		run
	end

	def head 
		puts "Head data: #{@head.value}"
		run
	end

	def tail
		puts "Tail data: #{@tail.value}"
		run
	end

	def at(index) #Value/data at a given index
		puts "The index is larger then the size of the list: #{@size}" if index >= @size
		puts "The value in the last index is: #{@tail.value}" if index < 0
		puts "Value at index #{index}: #{@head.value}" if index == 0
		counter = 0
		if index > 0 && index < @size
			until @node_value.next_node.nil?
				break if index == counter
				counter += 1
				@node_value = @node_value.next_node
			end
			puts "Value at index #{index}: #{@node_value.value}"
		end
		run
	end

	def pop #delete last element
		if @head.nil?
			puts "List is empty..."
		elsif @tail.nil?
			@head = nil
			@size -= 1
		else
			until @node_value.next_node == @tail
				@node_value = @node_value.next_node
			end
			@node_value.next_node = nil
			@tail = @node_value
			@size -= 1
		end
		run
	end

	def contains?(value)
		in_list = false
		until @node_value.next_node.nil?
			in_list = true if @node_value.value == value
			@node_value = @node_value.next_node
		end
		in_list = true if @tail.value == value
		puts "#{in_list}"
		run
	end

	def find(data) #Outputs the index of a given value/data
		index = 0
		until @node_value.next_node.nil?
			break if @node_value.value == data
			index += 1
			@node_value = @node_value.next_node
		end
		puts "'#{data}' is at index: #{index}" if data == @node_value.value
		puts "'#{data}' does not exist in the list." if @node_value.next_node.nil? && data != @tail.value
		run
	end

	def to_console #Displays the list
		if @head.nil?
			puts "List is empty..."
			run
		else
			until @node_value.next_node.nil?
				print "#{@node_value.value} -> "
				@node_value = @node_value.next_node
			end
			print "#{@tail.value} -> nil"
			puts ""
		end
		run
	end

	def insert_at(node, index)
		if index == 0
			append(node)
		elsif index == 1
			node.next_node = @head.next_node
			@head.next_node = node
			@size += 1
		else
			counter = 1
			until counter == index
				@node_value = @node_value.next_node
				counter += 1
			end
			node.next_node = @node_value.next_node
			@node_value.next_node = node
			@size += 1
		end
			run
	end

	def remove_at(index)
		@size -= 1
		if index == 0
			@head = @head.next_node
		else
			counter = 1
			until counter == index
				@node_value = @node_value.next_node
				counter += 1
			end
			@node_value.next_node = @node_value.next_node.next_node
		end
		run
	end
end

class Node < LinkedList
	attr_accessor :value, :next_node
	def initialize(value=nil, next_node=nil)
		@value = value
		@next_node = next_node
	end
end

LinkedList.new




















