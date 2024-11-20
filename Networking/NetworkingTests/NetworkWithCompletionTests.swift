import XCTest
@testable import Networking

class NetworkingWithCompletionTests: XCTestCase {

    var networking: NetworkingWithCompletion!
    var getSpy: HTTPGetWithCompletionSpy!
    var postSpy: HTTPPostWithCompletionSpy!
    var putSpy: HTTPPutWithCompletionSpy!
    var deleteSpy: HTTPDeleteWithCompletionSpy!
    var endPoint: Endpoint!

    override func setUp() {
        super.setUp()

        // Configuração dos spies
        getSpy = HTTPGetWithCompletionSpy()
        postSpy = HTTPPostWithCompletionSpy()
        putSpy = HTTPPutWithCompletionSpy()
        deleteSpy = HTTPDeleteWithCompletionSpy()

        // Criação da instância da classe Networking com os mocks
        networking = NetworkingWithCompletion(get: getSpy,
                                              post: postSpy,
                                              delete: deleteSpy,
                                              put: putSpy)
    }

    override func tearDown() {
        networking = nil
        getSpy = nil
        postSpy = nil
        putSpy = nil
        deleteSpy = nil
        super.tearDown()
    }

    func test_get_should_sucess() {
        let expectation = self.expectation(description: "GET request completed")
        let endpoint = EndpointMock()

        getSpy.resultToReturn = .success(["name": "John Doe"])

        networking.handler(endpoint, responseType: [String: String].self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data["name"], "John Doe")
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
        XCTAssertEqual(getSpy.capturedHeaders?["Authorization"], "Bearer token")
        XCTAssertEqual(getSpy.url, "https://api.example.com/users")
    }

    func testHandler_get() {
        let expectation = self.expectation(description: "POST request completed")
        let mockData = Data("""
        {
            "key": "value"
        }
        """.utf8)
        let endpoint = EndpointMock()
        endpoint.method = .POST
        endpoint.body = mockData

        postSpy.resultToReturn = .success(["status": "success"])

        networking.handler(endpoint, responseType: [String: String].self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data["status"], "success")
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)

        XCTAssertEqual(postSpy.capturedHeaders?["Authorization"], "Bearer token")
        XCTAssertEqual(postSpy.url, "https://api.example.com/users")
        XCTAssertEqual(postSpy.capturedBody as? String, "[name': 'John Doe']")
    }
}
