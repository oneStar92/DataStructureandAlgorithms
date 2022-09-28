func getMedianOfThree<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) -> T {
    let center: Int = lo + (hi - lo) / 2
    if list[lo] > list[center] {
        list.swapAt(lo, center)
    }
    
    if list[lo] > list[hi] {
        list.swapAt(lo, hi)
    }
    
    if list[center] > list[hi] {
        list.swapAt(center, hi)
    }
    
    list.swapAt(center, hi)

    return list[hi]
}

func partition<T: Comparable>(_ list: inout [T], lo: Int, hi: Int, midian: T) -> Int {
    let pivot = midian
    var loPointer = lo - 1
    var hiPointer = hi + 1
    while true {
        loPointer += 1
        while list[loPointer] < pivot { loPointer += 1 }
        hiPointer -= 1
        while list[hiPointer] > pivot { hiPointer -= 1 }
        if loPointer >= hiPointer {
            return hiPointer
        }
        list.swapAt(loPointer, hiPointer)
    }
}


func quickSort<T: Comparable>(_ list: inout [T], lo: Int, hi: Int) {
    if lo < hi {
        let midian = getMedianOfThree(&list, lo: lo, hi: hi)
        let pivot = partition(&list, lo: lo, hi: hi, midian: midian)
        
        quickSort(&list, lo: lo, hi: pivot)
        quickSort(&list, lo: pivot + 1, hi: hi)
    }
}
