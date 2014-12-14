//
//  Format.swift
//  PurboSwiftCsv
//
//  Created by Purbo Mohamad on 12/6/14.
//  Copyright (c) 2014 Purbo. All rights reserved.
//

import Foundation

public enum QuoteMode {
    case ALL
    case MINIMAL
    case NON_NUMERIC
    case NONE
}

public class Format {
    
    private var delimiter: Character
    private var quoteCharacter: Character? // nil if quoting is disabled
    private var quoteMode: QuoteMode
    private var commentMarker: Character?  // nil if commenting is disabled
    private var escapeCharacter: Character? // nil if escaping is disabled
    private var ignoreSurroundingSpaces: Bool // Should leading/trailing spaces be ignored around values?
    private var allowMissingColumnNames: Bool
    private var ignoreEmptyLines: Bool
    private var recordSeparator: String // for outputs
    private var nullString: String // the string to be used for null values
    private var header: [String?]? // array of header column names
    private var headerComments: [String?]? // array of header comment lines
    private var skipHeaderRecord: Bool
    
    /*
    class func defaultFormat() -> Format {
        return Format()
    }
    */
    
    public init(
        delimiter: Character,
        quoteChar: Character,
        quoteMode: QuoteMode,
        commentStart: Character,
        escape: Character,
        ignoreSurroundingSpaces : Bool,
        ignoreEmptyLines: Bool,
        recordSeparator: String,
        nullString: String,
        headerComments: [AnyObject?]?,
        header: [String?]?,
        skipHeaderRecord: Bool,
        allowMissingColumnNames: Bool) {
        
            self.delimiter = delimiter
            self.quoteCharacter = quoteChar
            self.quoteMode = quoteMode
            self.commentMarker = commentStart
            self.escapeCharacter = escape
            self.ignoreSurroundingSpaces = ignoreSurroundingSpaces
            self.allowMissingColumnNames = allowMissingColumnNames
            self.ignoreEmptyLines = ignoreEmptyLines
            self.recordSeparator = recordSeparator
            self.nullString = nullString
            self.headerComments = headerComments?.map({ $0?.description })
            self.header = header
            self.skipHeaderRecord = skipHeaderRecord
            //validate()
    }
    
    
    
    
}