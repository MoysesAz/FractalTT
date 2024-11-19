//
//  Products+CoreDataProperties.swift
//  
//
//  Created by Moyses Miranda do Vale Azevedo on 17/11/24.
//
//

import Foundation
import CoreData

extension Products {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Products> {
        return NSFetchRequest<Products>(entityName: "Products")
    }

    @NSManaged public var productDescription: String?
    @NSManaged public var product: String?
    @NSManaged public var tag: String?
    @NSManaged public var image: Data?

}
