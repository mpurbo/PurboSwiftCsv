//
//  Parser.swift
//  PurboSwiftCsv
//
//  Created by Purbo Mohamad on 11/29/14.
//  Copyright (c) 2014 Purbo. All rights reserved.
//

import Foundation

public class Format {
    
    class func defaultFormat() -> Format {
        return Format()
    }
    
    public init() {
        
    }
    
}

extension NSInputStream
{
    public func readString(length:Int) -> String {
        
        var str = ""
        
        if length > 0 {
            var readBuffer = UnsafeMutablePointer<UInt8>.alloc(length+1)
            
            var numberOfBytesRead = self.read(readBuffer, maxLength: length)
            if numberOfBytesRead == length {
                
                var buf = UnsafeMutablePointer<CChar>(readBuffer)
                buf[length] = 0
                // the C String must be null terminated
                if let utf8String = String.fromCString(buf) {
                    str = utf8String
                }
            }
            readBuffer.dealloc(length)
        }
        return str
        
    }
}

public class Parser {
    
    private let stream: NSInputStream
    private let format: Format
    
    @availability(iOS, introduced=4.0)
    public convenience init?(fromUrl url: NSURL) {
        self.init(fromStream: NSInputStream(URL: url)!)
    }
    
    public init(fromStream stream: NSInputStream) {
        self.stream = stream
        self.format = Format.defaultFormat()
    }
    
    public func parse() {
        
        let bufferSize = 1024
        var buffer = Array<UInt8>(count: bufferSize, repeatedValue: 0)
        
        stream.open()
        
        while stream.hasBytesAvailable {
            let bytesRead = stream.read(&buffer, maxLength: bufferSize)
            if bytesRead >= 0 {
                var output = NSString(bytes: &buffer, length: bytesRead, encoding: NSUTF8StringEncoding)
                print(output)
            } else {
                print("[ERROR] No more byte to read")
            }
        }
    }
    
}