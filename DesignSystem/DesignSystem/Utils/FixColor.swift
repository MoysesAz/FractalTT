import UIKit

public struct FixColor {
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat
}

struct BugFixColor {
    static func getColor(for lights: FixColor, dark: FixColor) -> UIColor {
        return UIColor { traitCollection in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: dark.red, green: dark.green, blue: dark.blue, alpha: dark.alpha)
            }
            return UIColor(red: lights.red, green: lights.green, blue: lights.blue, alpha: lights.alpha)
        }
    }
}
