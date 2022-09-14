public struct Queue<T> {
    private var elements = [T]()
    
    public var count: Int {
        return self.elements.count
    }
    public var capacity: Int {
        get {
            return self.elements.capacity
        }
        set {
            self.elements.reserveCapacity(newValue)
        }
    }
    
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    public var isFull: Bool {
        return self.count == self.capacity
    }
    
    public init() {}
    
    public mutating func enqueue(_ element: T) {
        self.elements.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return self.elements.removeFirst()
    }
    
    public func peak() -> T? {
        return self.elements.first
    }
    
    public mutating func clear() {
        self.elements.removeAll()
    }
}

extension Queue: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = T
    public init(arrayLiteral: ArrayLiteralElement...) {
        self.init()
        self.elements = arrayLiteral
    }
}

extension Queue: Sequence, IteratorProtocol {
    public typealias Element = T
    mutating public func next() -> Element? {
        if isEmpty {
            return nil
        } else {
            return self.dequeue()
        }
    }
}
