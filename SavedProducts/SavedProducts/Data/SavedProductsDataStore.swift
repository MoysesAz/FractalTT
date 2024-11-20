import Foundation
import CoreData
import Commons
import FractalData

public final class SavedProductsDataStore: SavedProductsDataStoreProtocol {
    public init(_ viewContext: NSManagedObjectContext? = nil) {
        self.viewContext = viewContext
    }

    public var viewContext: NSManagedObjectContext?
    public func getAllProducts() -> [Products]? {
        do {
            let products = try viewContext?.fetch(Products.fetchRequest())
            return products
        } catch {
            Log.message("SavedProductsDataStore(getAllProducts) - context save -> \(error)", .failure)
        }
        return nil
    }
}
