import UIKit
import FractalData

protocol CoordinatorProtocol {
    var nav: UINavigationController {get set}
    var managerData: ManagerDataProtocol { get set }
    init(nav: UINavigationController, managerData: ManagerDataProtocol)
    func start()
}
