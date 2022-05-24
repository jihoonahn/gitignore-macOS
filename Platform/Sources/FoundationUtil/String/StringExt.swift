import Foundation
import SwiftUI

extension String {
    public func widthOfString(usingFont font: Font) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

}
