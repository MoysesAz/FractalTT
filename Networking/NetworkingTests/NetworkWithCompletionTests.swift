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

        getSpy = HTTPGetWithCompletionSpy()
        postSpy = HTTPPostWithCompletionSpy()
        putSpy = HTTPPutWithCompletionSpy()
        deleteSpy = HTTPDeleteWithCompletionSpy()

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

    func test_hanlderGet_should_sucess() {
        let expectation = self.expectation(description: "GET request completed")
        let endpoint = EndpointMock()

        getSpy.resultToReturn = .success(["key": "value"])

        networking.handler(endpoint, responseType: [String: String].self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data["key"], "value")
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func test_hanlderPost_should_sucess() {
        let expectation = self.expectation(description: "POST request completed")
        let mockData = Data("""
        {
            "key": "value"
        }
        """.utf8)
        let endpoint = EndpointMock()
        endpoint.method = .POST
        endpoint.body = mockData

        postSpy.resultToReturn = .success(mockData)

        networking.handler(endpoint, responseType: Data.self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, mockData)
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func test_hanlderPut_should_sucess() {
        let expectation = self.expectation(description: "PUT request completed")
        let mockData = Data("""
        {
            "updatedKey": "updatedValue"
        }
        """.utf8)
        let endpoint = EndpointMock()
        endpoint.method = .PUT
        endpoint.body = mockData

        putSpy.resultToReturn = .success(mockData)

        networking.handler(endpoint, responseType: Data.self) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, mockData)
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }

    func test_hanlderDelete_should_sucess() {
        let expectation = self.expectation(description: "DELETE request completed")
        let endpoint = EndpointMock()
        endpoint.method = .DELETE
        let mockData = Data("""
        {
            "updatedKey": "updatedValue"
        }
        """.utf8)
        endpoint.body = mockData

        deleteSpy.resultToReturn = .success((mockData))

        networking.handler(endpoint, responseType: Data.self) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure(let error):
                XCTFail("Expected success, but got failure: \(error)")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1)
    }
}
