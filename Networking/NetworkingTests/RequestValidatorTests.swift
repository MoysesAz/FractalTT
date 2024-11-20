//
//  RequestValidatorTests.swift
//  NetworkingTests
//
//  Created by Moyses Miranda do Vale Azevedo on 19/11/24.
//

import XCTest
@testable import Networking

final class RequestValidatorTests: XCTestCase {
    var sut: RequestValidator!

    override func setUp() {
        super.setUp()
        sut = RequestValidator()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_validateURLString_should_ThrowNullURL_forNilURL() {
        XCTAssertThrowsError(try sut.validateURLString(nil)) { error in
            XCTAssertEqual(error as? NetworkErrors, .nullURL)
        }
    }

    func test_validadtedURLString_should_ThrowInvalidURL_forInvalidURL() {
        let invalidURL = ""
        XCTAssertThrowsError(try sut.validateURLString(invalidURL)) { error in
            XCTAssertEqual((error as? NetworkErrors), .invalidURL)
        }
    }

    func test_validateURLString_should_ReturnURL_forValidURL() throws {
        let validateURL = "https://www.google.com.br"
        let result = try sut.validateURLString(validateURL)
        XCTAssertEqual(result.absoluteString, validateURL)
    }

    func test_validateParameters_shoul_ReturnData_forInvalidParameters() throws {
        let validParameters: [String: Any] = ["results": 10, "next": "validParameters"]
        let result = try sut.validateParameters(validParameters)

        let expectedSON = try JSONSerialization.data(withJSONObject: validParameters)
        XCTAssertEqual(result, expectedSON)
    }

//    func test_validateParameters_should_ThrowEncondingError_forInvalidParameters() {
//        let invalidParameters: [String: Any] = ["": Date()]
//
//        XCTAssertThrowsError(try sut.validateParameters(invalidParameters)) { error in
//            XCTAssertEqual(error as? NetworkErrors, NetworkErrors.encodingError)
//        }
//    }
}
