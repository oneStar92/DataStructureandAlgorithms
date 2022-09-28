func merge<T: Comparable>(leftList: [T], rightList: [T]) -> [T] {
    
    var leftIndex: Int = 0
    var rightIndex: Int = 0
    var list: [T] = []
    list.reserveCapacity(leftList.count + rightList.count)
    
    while (leftIndex < leftList.count) && (rightIndex < rightList.count) {
        if leftList[leftIndex] < rightList[rightIndex] {
            list.append(leftList[leftIndex])
            leftIndex += 1
        } else if leftList[leftIndex] > rightList[rightIndex] {
            list.append(rightList[rightIndex])
            rightIndex += 1
        } else {
            list.append(leftList[leftIndex])
            list.append(rightList[rightIndex])
            leftIndex += 1
            rightIndex += 1
        }
    }
    
    list += Array(leftList[leftIndex..<leftList.count])
    list += Array(rightList[rightIndex..<rightList.count])
    
    return list
}

func mergeSort<T: Comparable>( _ list: [T]) -> [T] {
    if list.count < 2 {
        return list
    }
    
    let center: Int = list.count / 2
    return merge(leftList: mergeSort(Array(list[0..<center])), rightList: mergeSort(Array(list[center..<list.count])))
}
