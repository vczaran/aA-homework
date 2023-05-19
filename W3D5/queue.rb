class Queue

    def initialize
       @queue = []
    end

    def enqueue(el)
       @queue << el
    end

    def dequeue(el)
       @queue.shift
    end

    def peek
       @queue[0]
    end

end