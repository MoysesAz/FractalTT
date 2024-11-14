import UIKit

public enum HomeFactory {
    public static func make() -> some UIViewController {
        let homeViewController = HomeViewController()
        return homeViewController
    }
}
