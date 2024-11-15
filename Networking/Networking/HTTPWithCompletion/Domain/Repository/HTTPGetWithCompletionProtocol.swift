import Foundation

public protocol HTTPGetWithCompletionProtocol {
    var url: String? { get set }
    init()
    func handler<T: Decodable>(headers: [String: String]?,
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void)
}
