#if EMBED_VIEW
#if os(macOS)
import Cocoa
#elseif os(iOS)
import UIKit
typealias NSImage = UIImage
#endif
import SwiftUI

extension NSAttributedString: @unchecked Sendable {}

public struct Embed<V: View>: AttributedStringConvertible {
    public init(proposal: ProposedViewSize = .unspecified, @ViewBuilder view: () -> V) {
        self.proposal = proposal
        self.view = view()
    }

    var proposal: ProposedViewSize = .unspecified
    @ViewBuilder var view: V

    @MainActor
    public func attributedString(environment: EnvironmentValues) async -> [NSAttributedString] {
        let renderer = ImageRenderer(content: view)
        renderer.proposedSize = proposal
#if os(macOS)
        let resultSize = renderer.nsImage?.size ?? .zero
#else
        let resultSize = renderer.uiImage?.size ?? .zero
#endif
        let data = NSMutableData()
        renderer.render { size, renderer in
            var mediaBox = CGRect(origin: .zero, size: resultSize)
            guard let consumer = CGDataConsumer(data: data),
                  let pdfContext =  CGContext(consumer: consumer, mediaBox: &mediaBox, nil)
            else {
                return
            }
            pdfContext.beginPDFPage(nil)
            pdfContext.translateBy(x: mediaBox.size.width / 2 - size.width / 2,
                                   y: mediaBox.size.height / 2 - size.height / 2)
            renderer(pdfContext)
            pdfContext.endPDFPage()
            pdfContext.closePDF()
        }
        return NSImage(data: data as Data)!.attributedString(environment: environment)
    }
}
#endif
