import Foundation
import Networking

class HTTPGetWithCompletionSpy: HTTPGetWithCompletionProtocol {
    var url: String?

    private(set) var capturedHeaders: [String: String]?

    var resultToReturn: Result<Any, Error>?

    func handler<T: Decodable>(headers: [String: String]?,
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        capturedHeaders = headers

        if let result = resultToReturn {
            switch result {
            case .success(let value):
                if let decodedValue = value as? T {
                    completion(.success(decodedValue))
                } else {
                    completion(.failure(NSError(domain: "TypeError", code: 1, userInfo: nil)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
