public struct Stack<T> {
    private var elements: Array<T> = [T]()
    
    public var count: Int {
        return self.elements.count
    }
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    public init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    public func peak() -> T? {
        return self.elements.last
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public typealias Elements = T
    
    public init(arrayLiteral: Elements...) {
        self.init()
        self.elements = arrayLiteral
    }
}

extension Stack: Sequence, IteratorProtocol {
    mutating public func next() -> T? {
        if isEmpty {
            return nil
        } else {
            return self.pop()
        }
    }
}
