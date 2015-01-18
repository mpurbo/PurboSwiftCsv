// Playground - noun: a place where people can play

import UIKit

/*
var testArray: [AnyObject?]?
testArray = [1, "Baba", nil]
testArray?.map({ $0?.description })
*/

func newFormat(
    delimiter: Character,
    quoteChar: Character?,
    commentStart: Character?,
    escape: Character?,
    ignoreSurroundingSpaces : Bool,
    ignoreEmptyLines: Bool,
    recordSeparator: String,
    nullString: String,
    headerComments: [AnyObject?]?,
    header: [String?]?,
    skipHeaderRecord: Bool,
    allowMissingColumnNames: Bool) -> Void {
        
        
}

//Constants.COMMA, Constants.DOUBLE_QUOTE_CHAR, nil, nil, nil, false, true, Constants.CRLF, nil, nil, nil, false, false

newFormat(",", ",", nil, nil, false, true, ",", nil, nil, nil, false, false)