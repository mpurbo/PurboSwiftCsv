//
//  Constants.swift
//  PurboSwiftCsv
//
//  Ported from org.apache.commons.csv.Constants
//
//  Created by Purbo Mohamad on 12/7/14.
//  Copyright (c) 2014 Purbo. All rights reserved.
//

import Foundation

struct Constants {
    
    static let BACKSPACE: Character = "\u{0008}"
    static let COMMA: Character  = ","
    
    /**
        Starts a comment, the remainder of the line is the comment.
    */
    static let COMMENT: Character  = "#"
    
    static let CR: Character = "\r"
    static let DOUBLE_QUOTE_CHAR: Character = "\""
    static let BACKSLASH: Character = "\\"
    static let FF: Character = "\u{000C}"
    static let LF: Character = "\n"
    static let SP: Character = " "
    static let TAB: Character = "\t"
    
    /** 
        ASCII record separator 
    */
    static let RS: Character = "\u{001E}"
    
    /** 
        ASCII unit separator 
    */
    static let US: Character = "\u{001F}"
    
    static let EMPTY: String = ""
    
    /** 
        The end of stream symbol 
    */
    static let END_OF_STREAM: Int = -1
    
    /** 
        Undefined state for the lookahead char 
    */
    static let UNDEFINED: Int = -2
    
    /** 
        According to RFC 4180, line breaks are delimited by CRLF 
    */
    static let CRLF: String = "\r\n"
    
    /**
        Unicode line separator.
    */
    static let LINE_SEPARATOR: Character = "\u{2028}"
    
    /**
        Unicode paragraph separator.
    */
    static let PARAGRAPH_SEPARATOR: Character = "\u{2029}"
    
    /**
        Unicode next line.
    */
    static let NEXT_LINE: String = "\u{0085}"
    
}