import UIKit

extension Luxus.Tokens.Colors {
    public struct Background {
        public static var lxPrimary: UIColor {
            UIColor(named: "Colors/Background/Primary") ?? .green
        }
        public static var lxSecondy: UIColor {
            UIColor(named: "Colors/Background/Secondary")!
        }
    }
}

extension Luxus.Tokens.Colors {
    public struct Font {
        public static var lxPrimary: UIColor {
            return UIColor(named: "Colors/Background/Primary") ?? .green
        }
    }
}

extension Luxus.Tokens.Colors {
    public struct Primary {
        public static var lxPrimary: UIColor {
            BugFixColor.getColor(for: .init(red: 0.29, green: 0.56, blue: 0.89, alpha: 1),
                                 dark: .init(red: 16, green: 31, blue: 41, alpha: 1))
        }
    }
}

extension Luxus.Tokens.Font {
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
