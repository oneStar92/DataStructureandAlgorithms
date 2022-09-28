func insertionSort<T: Comparable>(_ list: inout [T]) {
    if list.count <= 1 {
        return
    }
    
    for currentIndex in 1..<list.count {
        let targetValue: T = list[currentIndex]
        var sortingPointer = currentIndex
        while sortingPointer > 0 && list[sortingPointer - 1] > targetValue {
            list[sortingPointer] = list[sortingPointer - 1]
            sortingPointer -= 1
        }
        list[sortingPointer] = targetValue
    }
}
