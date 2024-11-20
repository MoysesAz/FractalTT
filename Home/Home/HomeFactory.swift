import UIKit

public enum HomeFactory {
    public static func make(_ flowDelegate: HomeFlowProtocol? = nil) -> some UIViewController {
        let homeViewController = HomeViewController()
        homeViewController.flowdelegate = flowDelegate
        return homeViewController
    }
}
