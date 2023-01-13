//
//  File.swift
//  
//
//  Created by Jason Jobe on 1/13/23.
//

#if canImport(Cocoa)
import Cocoa
public typealias XColor = NSColor
public typealias XFont = NSFont

#elseif canImport(UIKit)
import UIKit
public typealias XColor = UIColor
public typealias XFont = UIFont

public extension XColor {
    static var textColor: XColor { UIColor.darkText }
    static var gray: XColor { UIColor.systemGray }
}

#elseif canImport(SwiftUI)
import SwiftUI
public typealias XColor = Color
public typealias XFont = Font

public extension XColor {
    static var textColor: XColor { Color.primary }
}
#endif
