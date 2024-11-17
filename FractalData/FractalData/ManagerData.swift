import CoreData
import Commons

public protocol ManagerDataProtocol {
    var viewContext: NSManagedObjectContext? { get set }
    init(_ viewContext: NSManagedObjectContext?)
}

public final class ManagerData: ManagerDataProtocol {
    public init(_ viewContext: NSManagedObjectContext?) {
        self.viewContext = viewContext
    }

    public var viewContext: NSManagedObjectContext?

    func getAllProducts() -> [Products]? {
        do {
            let products = try viewContext?.fetch(Products.fetchRequest())
            return products
        } catch {
            Log.message("ManagerData(getAllProducts) - context save -> \(error)", .failure)
        }
        return nil
    }

    func createProduct(product: Products) {
        guard let context = viewContext else {
            Log.message("ManagerData(createProduct) - no viewContext", .warning)
            return
        }

        let newProduct = Products(context: context)
        newProduct.tag = product.tag
        newProduct.productDescription = product.productDescription
        newProduct.image = product.image
        newProduct.product = product.product

        do {
            try context.save()
            Log.message("ManagerData(createProduct) product save", .success)
        } catch {
            Log.message("ManagerData(createProduct) - context save -> \(error)", .failure)
        }

    }

    func deleteProduct(product: Products) {
        viewContext?.delete(product)

        do {
            try viewContext?.save()
            Log.message("ManagerData(deleteProduct) product save", .success)
        } catch {
            Log.message("ManagerData(deleteProduct) - context save -> \(error)", .failure)
        }
    }
}
