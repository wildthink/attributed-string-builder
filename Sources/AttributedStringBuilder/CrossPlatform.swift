//
//  File.swift
//  
//
//  Created by Jason Jobe on 1/13/23.
//

#if os(macOS)
import Cocoa
public typealias XColor = NSColor
public typealias XFont = NSFont

#elseif os(iOS)
import UIKit
public typealias XColor = UIColor
public typealias XFont = UIFont

public extension XColor {
    static var textColor: XColor { UIColor.darkText }
    static var gray: XColor { UIColor.systemGray }
}

typealias NSFontDescriptor = UIFontDescriptor
extension NSFontDescriptor.SymbolicTraits {
    static var bold: NSFontDescriptor.SymbolicTraits = .traitBold
    static var italic: NSFontDescriptor.SymbolicTraits = .traitItalic
}
#endif
