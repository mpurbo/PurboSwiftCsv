// Playground - noun: a place where people can play

import UIKit

/*
var testArray: [AnyObject?]?
testArray = [1, "Baba", nil]
testArray?.map({ $0?.description })
*/

var str1 = "AA"
var strArray = [str1, "BB", "CC"]
var strArrayCopy = strArray

str1 = "DD"
strArrayCopy[0] = "XX"

print(strArray)
print(strArrayCopy)
