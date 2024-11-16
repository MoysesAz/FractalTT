import Foundation

public protocol NetworkWithCompletionProtocol {
    func handler<T>(_ endpoint: Endpoint,
                    responseType: T.Type,
                    completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable
}

public class NetworkingWithCompletion: NetworkWithCompletionProtocol {
    var get: HTTPGetWithCompletionProtocol
    var post: HTTPPostWithCompletionProtocol
    var delete: HTTPDeleteWithCompletionProtocol
    var put: HTTPPutWithCompletionProtocol

    public init(get: HTTPGetWithCompletionProtocol = URLSessionGetWithCompletion(),
                post: HTTPPostWithCompletionProtocol = URLSessionPostWithCompletion(),
                delete: HTTPDeleteWithCompletionProtocol = URLSessionDeleteWithCompletion(),
                put: HTTPPutWithCompletionProtocol = URLSessionPutWithCompletion()) {
        self.get = get
        self.post = post
        self.delete = delete
        self.put = put
    }

    public func handler<T>(_ endpoint: Endpoint,
                           responseType: T.Type,
                           completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable {

        switch endpoint.method {
        case .GET:
            get.url = endpoint.baseUrl + endpoint.path
            get.handler(headers: endpoint.headers,
                    responseType: responseType,
                    completion: completion)
        case .POST:
            post.url = endpoint.baseUrl + endpoint.path
            post.handler(body: endpoint.body,
                      parameters: endpoint.queries,
                      headers: endpoint.headers,
                      responseType: responseType,
                      completion: completion)
        case .PUT:
            put.url = endpoint.baseUrl + endpoint.path
            put.handler(body: endpoint.body,
                      parameters: endpoint.queries,
                      headers: endpoint.headers,
                      responseType: responseType,
                      completion: completion)
        case .DELETE:
            delete.url = endpoint.baseUrl + endpoint.path
            delete.handler(body: endpoint.body,
                      parameters: endpoint.queries,
                      headers: endpoint.headers,
                      responseType: responseType,
                      completion: completion)
        }

    }
}
