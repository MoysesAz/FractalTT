import UIKit

extension Luxus.Tokens.Colors {
    public struct Background {
        public static var lxPrimary: UIColor {
            UIColor(named: "Colors/Background/Primary") ?? .green
        }
        public static var lxSecondy: UIColor {
            UIColor(named: "Colors/Background/Secondary") ?? .green
        }
    }
}

extension Luxus.Tokens.Colors {
    public struct Font {
        public static var lxPrimary: UIColor {
            return UIColor(named: "Colors/Font/Primary") ?? .green
        }
    }
}

extension Luxus.Tokens.Colors {
    public struct Primary {
        public static var lxPrimary: UIColor {
            return UIColor(named: "Colors/Primary/Primary") ?? .green
        }

        public static var lxSecondary: UIColor {
            return UIColor(named: "Colors/Primary/Secondary") ?? .green
        }

    }
}

extension Luxus.Tokens.Font {
        public static func montserratMedium(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-Medium"
            guard let customFont = UIFont(name: font, size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }

        public static func montserratSemiBold(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-SemiBold"
            guard let customFont = UIFont(name: font, size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }

        public static func montserratBold(_ size: CGFloat = UIFont.labelFontSize) -> UIFont {
            let font = "Montserrat-Bold"
            guard let customFont = UIFont(name: "Montserrat-Bold", size: size) else {
                print("\(font) couldn't be found")
                return UIFont.systemFont(ofSize: size)
            }

            return customFont
        }
}
