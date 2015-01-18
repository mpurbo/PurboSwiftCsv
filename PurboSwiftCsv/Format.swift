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
    private var quoteMode: QuoteMode?
    private var commentMarker: Character?  // nil if commenting is disabled
    private var escapeCharacter: Character? // nil if escaping is disabled
    private var ignoreSurroundingSpaces: Bool // Should leading/trailing spaces be ignored around values?
    private var allowMissingColumnNames: Bool
    private var ignoreEmptyLines: Bool
    private var recordSeparator: String // for outputs
    private var nullString: String? // the string to be used for null values
    private var header: [String?]? // array of header column names
    private var headerComments: [String?]? // array of header comment lines
    private var skipHeaderRecord: Bool
    
    private init(
        delimiter: Character,
        quoteChar: Character?,
        quoteMode: QuoteMode?,
        commentStart: Character?,
        escape: Character?,
        ignoreSurroundingSpaces : Bool,
        ignoreEmptyLines: Bool,
        recordSeparator: String,
        nullString: String?,
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
    }
    
    private struct DefaultStruct {
        static let property: Format = Format.newFormat(
            delimiter: Constants.COMMA,
            quoteChar: Constants.DOUBLE_QUOTE_CHAR,
            quoteMode: nil,
            commentStart: nil,
            escape: nil,
            ignoreSurroundingSpaces: false,
            ignoreEmptyLines: true,
            recordSeparator: Constants.CRLF,
            nullString: nil,
            headerComments: nil,
            header: nil,
            skipHeaderRecord: false,
            allowMissingColumnNames: false,
            errorHandler: nil)!
    }
    public class var Default: Format {
        return DefaultStruct.property
    }
    
    public class func newFormat(
        #delimiter: Character,
        quoteChar: Character?,
        quoteMode: QuoteMode?,
        commentStart: Character?,
        escape: Character?,
        ignoreSurroundingSpaces : Bool,
        ignoreEmptyLines: Bool,
        recordSeparator: String,
        nullString: String?,
        headerComments: [AnyObject?]?,
        header: [String?]?,
        skipHeaderRecord: Bool,
        allowMissingColumnNames: Bool,
        errorHandler: ((String)->Format?)? = nil) -> Format? { // TODO: default result should be function returning defaultFormat
        
            // validate
            
            if isLineBreak(delimiter) {
                return errorHandler?("The delimiter cannot be a line break")
            }
            
            if let test = quoteChar {
                if test == delimiter {
                    return errorHandler?("The quoteChar character and the delimiter cannot be the same ('\(quoteChar)')")
                }
                if test == commentStart {
                    return errorHandler?("The comment start character and the quoteChar cannot be the same ('\(commentStart)')")
                }
            }
            
            if let test = escape {
                if test == delimiter {
                    return errorHandler?("The escape character and the delimiter cannot be the same ('\(quoteChar)')")
                }
                if test == commentStart {
                    return errorHandler?("The comment start and the escape character cannot be the same ('\(commentStart)')")
                }
            } else if quoteMode == QuoteMode.NONE {
                return errorHandler?("No quotes mode set but no escape character is set")
            }
            
            if commentStart? == delimiter {
                return errorHandler?("The comment start character and the delimiter cannot be the same ('\(quoteChar)')")
            }
            
            if commentStart? == delimiter {
                return errorHandler?("The comment start character and the delimiter cannot be the same ('\(quoteChar)')")
            }
            
            // validate header (not allowing duplicate entry)
            
            if let nnheader = header {
                for a in nnheader {
                    if let val = a {
                        var count = 0
                        for b in nnheader {
                            if val == b {
                                count++
                                if count > 1 {
                                    return errorHandler?("The header contains a duplicate entry ('\(b)')")
                                }
                            }
                        }
                    }
                }
            }
            
            return Format(
                delimiter: delimiter,
                quoteChar: quoteChar,
                quoteMode: quoteMode,
                commentStart: commentStart,
                escape: escape,
                ignoreSurroundingSpaces: ignoreSurroundingSpaces,
                ignoreEmptyLines: ignoreEmptyLines,
                recordSeparator: recordSeparator,
                nullString: nullString,
                headerComments: headerComments,
                header: header,
                skipHeaderRecord: skipHeaderRecord,
                allowMissingColumnNames:allowMissingColumnNames)
    }
    
    private class func isLineBreak(c: Character) -> Bool {
        return c == Constants.LF || c == Constants.CR;
    }
    
}