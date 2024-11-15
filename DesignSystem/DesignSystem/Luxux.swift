import UIKit

public struct Luxux {
    public struct Tokens {
        public struct Colors {
            public struct Background {
                public static var lxPrimary: UIColor {
                    UIColor(named: "Colors/Background/Primary")!
                }

                public static var lxSecondy: UIColor {
                    UIColor(named: "Colors/Background/Secondary")!
                }

                public static var lxTerciary: UIColor {
                    UIColor(named: "Colors/Background/Tertiary")!
                }
            }

            public struct Font {
                public static var lxPrimary: UIColor {
                    UIColor(named: "Colors/Background/Primary")!
                }
            }

        }

        public struct Font {
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


    }
}
