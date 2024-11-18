import Foundation

public struct PaginationAllProductsModel: Decodable {
    public var prev: String?
    public var next: String?

    init(prev: String? = nil, next: String? = nil) {
        self.prev = prev
        self.next = next
    }

}
