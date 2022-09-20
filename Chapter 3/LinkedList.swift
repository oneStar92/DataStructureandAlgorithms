class Node<T> {
    var next: Node<T>? = nil
    var data: T
    init(_ data: T) {
        self.data = data
    }
    deinit {
        print(data)
    }
}

struct LinkedList<T> {
    private(set) var head: Node<T>? = nil
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func push(_ element: T) {
        if isEmpty {
            self.head = Node(element)
        } else {
            let nextHead = Node(element)
            nextHead.next = self.head
            self.head = nextHead
        }
        count += 1
    }
    
    mutating func pop() -> T? {
        guard let nowHead = head else {
            return nil
        }
        self.head = head?.next
        count -= 1
        return nowHead.data
    }
    
    func peak() -> T? {
        guard let head = head else {
            return nil
        }
        return head.data
    }
    
    mutating func clear() {
        self.head = nil
        self.count = 0
    }
}
