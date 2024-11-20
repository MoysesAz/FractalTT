import Foundation
import Networking

class NetworkWithCompletionSpy: NetworkWithCompletionProtocol {
    private(set) var handlerCallCount = 0
    private(set) var lastEndpoint: Endpoint?
    private(set) var lastResponseType: Any.Type?

    var resultToReturn: Any?

    func handler<T>(_ endpoint: Endpoint,
                    responseType: T.Type,
                    completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable {
        handlerCallCount += 1
        lastEndpoint = endpoint
        lastResponseType = responseType

        if let result = resultToReturn as? Result<T, any Error> {
            completion(result)
        }
    }
}
