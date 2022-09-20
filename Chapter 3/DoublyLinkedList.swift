class Node<T> {
    var next: Node<T>? = nil
    weak var previous: Node<T>? = nil
    var data: T
    init(_ data: T) {
        self.data = data
    }
}

struct DoublyLinkedList<T: Equatable> {
    private(set) var head: Node<T>? = nil
    private(set) var tail: Node<T>? = nil
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    var first: T? {
        return head?.data
    }
    var last: T? {
        return tail?.data
    }
    
    mutating func append(_ element: T) {
        let newNode: Node<T> = Node(element)
        if isEmpty {
            self.head = newNode
            self.tail = newNode
        } else {
            self.tail?.next = newNode
            newNode.previous = self.tail
            self.tail = newNode
        }
        count += 1
    }
    
    mutating func removeFirst() -> T? {
        guard let nowHead = head else {
            return nil
        }
        if count == 1 {
            head = nil
            tail = nil
        } else {
            self.head = head?.next
        }
        count -= 1
        return nowHead.data
    }
    
    mutating func removeLast() -> T? {
        guard let nowTail = tail else {
            return nil
        }
        if count == 1 {
            head = nil
            tail = nil
        } else {
            self.tail?.previous?.next = nil
            self.tail = tail?.previous
        }
        count -= 1
        return nowTail.data
    }
    
    func searchNode(from data: T?) -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var node = head
        while node?.next != nil {
            if node?.data == data {
                break
            }
            node = node?.next
        }
        
        return node
    }
    
    func searchNodeFromTail(from data: T?) -> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var node = tail
        while node?.previous != nil {
            if node?.data == data {
                break
            }
            node = node?.previous
        }
        
        return node
    }
    
    mutating func clear() {
        self.head = nil
        self.tail = nil
        self.count = 0
    }
}
