import UIKit

extension Luxux.Tokens.Colors {
    public struct Background {
        public static var lxPrimary: UIColor {
            BugFixColor.getColor(for: .init(red: 1, green: 1, blue: 1, alpha: 1),
                                 dark: .init(red: 0, green: 0, blue: 0, alpha: 1))
            //                    UIColor(named: "New/Background/Primary") ?? .red
        }
        public static var lxSecondy: UIColor {
            BugFixColor.getColor(for: .init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1),
                                 dark: .init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))
            //                    UIColor(named: "Colors/Background/Secondary")!
        }
    }
}

extension Luxux.Tokens.Colors {
    public struct Font {
        public static var lxPrimary: UIColor {
            BugFixColor.getColor(for: .init(red: 0.4, green: 0.4, blue: 0.4, alpha: 1),
                                 dark: .init(red: 1, green: 1, blue: 1, alpha: 1))
        }
    }
}



extension Luxux.Tokens.Font {
        static func montserratMedium(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-Medium"
            guard let customFont = UIFont(name: font, size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }

        static func montserratSemiBold(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-SemiBold"
            guard let customFont = UIFont(name: font, size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }

        static func montserratBold(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-Bold"
            guard let customFont = UIFont(name: "Montserrat-Bold", size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }
}
