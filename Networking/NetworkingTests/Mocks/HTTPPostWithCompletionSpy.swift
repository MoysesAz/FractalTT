import Foundation
import Networking

class HTTPPostWithCompletionSpy: HTTPPostWithCompletionProtocol {
    var url: String?
    private(set) var capturedBody: Data?
    private(set) var capturedParameters: [String: Any]?
    private(set) var capturedHeaders: [String: String]?

    var resultToReturn: Result<Any, Error>?

    func handler<T: Decodable>(body: Data?,
                               parameters: [String: Any]?,
                               headers: [String: String],
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        capturedBody = body
        capturedParameters = parameters
        capturedHeaders = headers

        if let result = resultToReturn {
            switch result {
            case .success(let mockData):
                if let data = mockData as? T {
                    completion(.success(data))
                } else {
                    let decodingError = NSError(domain: "DecodingError",
                                                code: -1,
                                                userInfo: [NSLocalizedDescriptionKey: "Mock data type mismatch."])
                    completion(.failure(decodingError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        } else {
            let defaultError = NSError(domain: "MockError", code: -1,
                                       userInfo: [NSLocalizedDescriptionKey: "No result provided in mock."])
            completion(.failure(defaultError))
        }
    }
}
