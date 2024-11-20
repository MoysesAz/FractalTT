import Foundation

public protocol HTTPPutWithCompletionProtocol {
    var url: String? { get set }
    func handler<T: Decodable>(body: Data?,
                               parameters: [String: Any]?,
                               headers: [String: String],
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void)
}
