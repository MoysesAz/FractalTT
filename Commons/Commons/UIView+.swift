import UIKit

extension UIView {
    public func makeRounded(_ value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
}
