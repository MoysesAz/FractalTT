import CoreData
import Commons
import FractalData

public final class ProductDetailsDataStore: ProductDetailsDataStoreProtocol {
    public init(_ viewContext: NSManagedObjectContext? = nil) {
        self.viewContext = viewContext
    }

    public var viewContext: NSManagedObjectContext?

    public func getProduct(byProductName product: String) -> [Products]? {
        guard let context = viewContext else {
            Log.message("ManagerData(getProducts) - no viewContext", .warning)
            return nil
        }

        let fetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product = %@", product)

        do {
            let products = try context.fetch(fetchRequest)

            if products.isEmpty {
                Log.message("ManagerData(getProducts) - No products found with name '\(product)'", .warning)
                return nil
            } else {
                Log.message("ManagerData(getProducts) - Products with name '\(product)' fetched successfully", .success)
                return products
            }
        } catch {
            Log.message("ManagerData(getProducts) - fetch request failed -> \(error)", .failure)
            return nil
        }
    }

    public func getAllProducts() -> [Products]? {
        do {
            let products = try viewContext?.fetch(Products.fetchRequest())
            return products
        } catch {
            Log.message("ManagerData(getAllProducts) - context save -> \(error)", .failure)
        }
        return nil
    }

    public func createProduct(product: String, tag: String, productDescription: String, image: Data) -> Bool {
        guard let context = viewContext else {
            Log.message("ManagerData(createProduct) - no viewContext", .warning)
            return false
        }

        let fetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product = %@", product)

        do {
            let existingProducts = try context.fetch(fetchRequest)
            if !existingProducts.isEmpty {
                Log.message("ManagerData(createProduct) - Produto com tag \(product) já existe", .warning)
                return false
            }
        } catch {
            Log.message("ManagerData(createProduct) - Erro ao verificar duplicatas: \(error)", .failure)
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

    public func deleteProduct(byProductName product: String) -> Bool {
        guard let context = viewContext else {
            Log.message("ManagerData(deleteProduct) - no viewContext", .warning)
            return false
        }

        let fetchRequest: NSFetchRequest<Products> = Products.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "product == %@", product)

        do {
            let products = try context.fetch(fetchRequest)

            if !products.isEmpty {
                for productToDelete in products {
                    context.delete(productToDelete)
                }
                do {
                    try context.save()
                    Log.message("ManagerData(deleteProduct) - Products with name '\(product)' deleted", .success)
                    return true
                } catch {
                    Log.message("ManagerData(deleteProduct) - context save -> \(error)", .failure)
                    return false
                }
            } else {
                Log.message("ManagerData(deleteProduct) - No products found with name '\(product)'", .warning)
                return false
            }
        } catch {
            Log.message("ManagerData(deleteProduct) - fetch request failed -> \(error)", .failure)
            return false
        }
    }

}
