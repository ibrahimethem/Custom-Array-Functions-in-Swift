//
//  main.swift
//  Custom Array Functions in Swift
//
//  Created by İbrahim Ethem Karalı on 22.08.2020.
//  Copyright © 2020 İbrahim Ethem Karalı. All rights reserved.
//

import Foundation

extension Array {
    
    func myfilter(condition: (Element) -> Bool) -> [Element] {
        var array = self
        
        for item in array {
            if condition(item) {
                array.append(item)
            }
        }
        
        return array
    }
    
    
    func mySorted(condition: (Element, Element) -> Bool) -> [Element] {
        var array = self
        
        for i in 0..<(array.count-1) {
            var firstIndex = i
            
            for j in (i+1)..<array.count {
                if condition(array[j],array[firstIndex]) {
                    firstIndex = j
                }
            }
            
            let temp = array[firstIndex]
            array[firstIndex] = array[i]
            array[i] = temp
        }
        
        return array
    }
    
}

let intArray:[Int] = [10,3,7,3,5,9,0,6,3,5,7,42,1,62,23,11,99]

let filteredArray = intArray.filter { (int) -> Bool in
    int > 3
}

print("Original array:\n\(intArray)")
print("Filtered array:\n\(filteredArray)")


let sortedArray = intArray.mySorted { (n1, n2) -> Bool in
    n1 < n2
}

print("Original array:\n\(intArray)")
print("Sorted array:\n\(sortedArray)")


/// Returns:
///
/// Original array:
/// [10, 3, 7, 3, 5, 9, 0, 6, 3, 5, 7, 42, 1, 62, 23, 11, 99]
/// Filtered array:
/// [10, 7, 5, 9, 6, 5, 7, 42, 62, 23, 11, 99]
/// Original array:
/// [10, 3, 7, 3, 5, 9, 0, 6, 3, 5, 7, 42, 1, 62, 23, 11, 99]
/// Sorted array:
/// [0, 1, 3, 3, 3, 5, 5, 6, 7, 7, 9, 10, 11, 23, 42, 62, 99]
///

