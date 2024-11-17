import CoreData
import Commons

public protocol ManagerDataProtocol {
    var viewContext: NSManagedObjectContext? { get set }
    func getAllProducts() -> [Products]?
    func createProduct(tag: String, productDescription: String, product: String, image: Data) -> Bool
    func deleteProduct(tag: String, productDescription: String, product: String, image: Data) -> Bool
    init(_ viewContext: NSManagedObjectContext?)
}

public final class ManagerData: ManagerDataProtocol {
    public init(_ viewContext: NSManagedObjectContext?) {
        self.viewContext = viewContext
    }

    public var viewContext: NSManagedObjectContext?

    public func getAllProducts() -> [Products]? {
        do {
            let products = try viewContext?.fetch(Products.fetchRequest())
            return products
        } catch {
            Log.message("ManagerData(getAllProducts) - context save -> \(error)", .failure)
        }
        return nil
    }

    public func createProduct(tag: String, productDescription: String, product: String, image: Data) -> Bool {
        guard let context = viewContext else {
            Log.message("ManagerData(createProduct) - no viewContext", .warning)
            return false
        }

        let newProduct = Products(context: context)
        newProduct.tag = tag
        newProduct.productDescription = productDescription
        newProduct.image = image
        newProduct.product = product

        do {
            try context.save()
            Log.message("ManagerData(createProduct) product save", .success)
            return true

        } catch {
            Log.message("ManagerData(createProduct) - context save -> \(error)", .failure)
            return false
        }

    }

    public func deleteProduct(tag: String,
                              productDescription: String,
                              product: String,
                              image: Data) -> Bool {

        guard let context = viewContext else {
            Log.message("ManagerData(deleteProduct) - no viewContext", .warning)
            return false
        }

        // Buscar o produto no contexto
        let fetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "tag == %@ AND productDescription == %@ AND product == %@ AND image == %@", tag, productDescription, product, image as CVarArg)

        do {
            let products = try context.fetch(fetchRequest)

            // Verificar se o produto foi encontrado
            if let productToDelete = products.first {
                context.delete(productToDelete)

                do {
                    try viewContext?.save()
                    Log.message("ManagerData(deleteProduct) product deleted", .success)
                    return true
                } catch {
                    Log.message("ManagerData(deleteProduct) - context save -> \(error)", .failure)
                    return false
                }
            } else {
                Log.message("ManagerData(deleteProduct) - product not found", .warning)
                return false
            }
        } catch {
            Log.message("ManagerData(deleteProduct) - fetch request failed -> \(error)", .failure)
            return false
        }
    }

}
