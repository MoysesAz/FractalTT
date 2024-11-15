import Foundation

public protocol HTTPPostWithCompletionProtocol {
    var url: String? { get set }
    init()
    func handler<T: Decodable>(body: Data?,
                               parameters: [String: Any]?,
                               headers: [String: String],
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void)
}
