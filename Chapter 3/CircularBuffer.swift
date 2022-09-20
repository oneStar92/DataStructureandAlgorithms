enum CircularBufferOperation {
    case ignore, overWrite
}

struct CircularBuffer<T> {
    private(set) var data: [T?] = [T]()
    private(set) var head: Int = 0, tail: Int = 0
    private(set) var count: Int = 0
    private(set) var operation: CircularBufferOperation = .ignore
    
    var capacity: Int {
        return data.capacity
    }
    var isEmpty: Bool {
        return count == 0
    }
    var isFull: Bool {
        return count == capacity
    }
    private let defaultCapacity: Int = 10
    
    init() {
        data.reserveCapacity(defaultCapacity)
        tail = capacity - 1
    }
    
    init(capacity: Int) {
        data.reserveCapacity(capacity)
        tail = capacity - 1
    }
    
    mutating func push(_ element: T) {
        if data.endIndex < data.capacity {
            data.append(element)
            self.count += 1
            return
        }
        
        if operation == .ignore && isFull {
            return
        } else if !isFull {
            tail = increment(index: tail)
        } else {
            head = increment(index: head)
            tail = increment(index: tail)
        }
        
        if self.count < capacity {
            self.count += 1
        }
        data[tail] = element
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        let element = data[head]
        data[head] = nil
        head = increment(index: head)
        self.count -= 1
        
        return element
    }
    
    func peak() -> T? {
        if isEmpty {
            return nil
        }
        return self.data[head]
    }
    
    private func increment(index: Int) -> Int {
        let nextIndex = index + 1
        return nextIndex < capacity ? nextIndex : 0
    }
    
    mutating func setOperation(_ operation: CircularBufferOperation) {
        self.operation = operation
    }
}

extension CircularBuffer: Sequence, IteratorProtocol {
    mutating public func next() -> T? {
        if isEmpty {
            return nil
        } else {
            return self.pop()
        }
    }
}
