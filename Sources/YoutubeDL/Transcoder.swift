//
//  Transcoder.swift
//
//  Copyright (c) 2020 Changbeom Ahn
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation

public typealias TimeRange = Range<TimeInterval>

public enum FFmpegError: Error {
    case exit(code: Int)
}

open class Transcoder {
    open var progressBlock: ((Double) -> Void)?
    
    public init(progressBlock: ((Double) -> Void)? = nil) {
        self.progressBlock = progressBlock
    }
    
    @available(iOS 13.0, *)
    open func transcode(from: URL, to url: URL, timeRange: TimeRange?, bitRate: Double?) throws {
         throw FFmpegError.exit(code: 69)
    }
}

public func format(_ seconds: Int) -> String? {
    guard seconds >= 0 else {
        print(#function, "invalid seconds:", seconds)
        return nil
    }
    
    let (minutes, sec) = seconds.quotientAndRemainder(dividingBy: 60)
    var string = "\(sec)"
    guard minutes > 0 else {
        return string
    }
    
    let (hours, min) = minutes.quotientAndRemainder(dividingBy: 60)
    string = "\(min):" + (sec < 10 ? "0" : "") + string
    guard hours > 0 else {
        return string
    }
    
    return "\(hours):" + (min < 10 ? "0" : "") + string
}
