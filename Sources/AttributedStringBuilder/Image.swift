#if canImport(Cocoa)
import Cocoa

extension NSImage: AttributedStringConvertible {
    public func attributedString(environment: Environment) -> [NSAttributedString] {
        let attachment = NSTextAttachment()
        attachment.image = self
        return [
            .init(attachment: attachment)
        ]
    }
}
#elseif canImport(UIKit)
import UIKit

extension UIImage: AttributedStringConvertible {
    public func attributedString(environment: Environment) -> [NSAttributedString] {
        let attachment = NSTextAttachment()
        attachment.image = self
        return [
            .init(attachment: attachment)
        ]
    }
}

#endif
