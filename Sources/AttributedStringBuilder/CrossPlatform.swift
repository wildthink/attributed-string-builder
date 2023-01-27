//
//  File.swift
//  
//
//  Created by Jason Jobe on 1/13/23.
//

#if os(macOS)
import Cocoa
public typealias NSColor = Cocoa.NSColor
public typealias NSFont = Cocoa.NSFont
public typealias NSImage = Cocoa.NSImage

#elseif os(iOS)
import UIKit
public typealias NSColor = UIColor
public typealias NSFont = UIFont
public typealias NSImage = UIImage
public typealias NSCursor = UIImage

//public let NSUnderlineStyle: NSAttributedString.Key = .underlineStyle
public struct NSUnderlineStyle: RawRepresentable {
    public var rawValue: String
    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    static var single: NSUnderlineStyle = .init(rawValue: "single")
}

public extension NSImage {
    static var arrow: NSImage = NSImage(systemName: "arrow")!
}

public extension NSColor {

    static var textColor: NSColor { UIColor.darkText }
    static var secondaryLabelColor: NSColor { UIColor.secondaryLabel }
    static var controlAccentColor: NSColor { UIColor.tintColor }
    static var gray: NSColor { UIColor.systemGray }
}

typealias NSFontDescriptor = UIFontDescriptor
extension NSFontDescriptor.SymbolicTraits {
    static var bold: NSFontDescriptor.SymbolicTraits = .traitBold
    static var italic: NSFontDescriptor.SymbolicTraits = .traitItalic
}
#endif
