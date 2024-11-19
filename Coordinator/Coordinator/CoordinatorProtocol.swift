import UIKit
import CoreData

protocol CoordinatorProtocol {
    var nav: UINavigationController { get set }
    var coreDataContext: NSManagedObjectContext? { get set }
    init(nav: UINavigationController, coreDataContext: NSManagedObjectContext?)
    func start()
}
