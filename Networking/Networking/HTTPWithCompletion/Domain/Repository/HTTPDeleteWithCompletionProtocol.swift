import Foundation

public protocol HTTPDeleteWithCompletionProtocol {
    var url: String? { get set }
    func handler<T: Decodable>(body: Data?,
                               parameters: [String: Any]?,
                               headers: [String: String],
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void)
}
