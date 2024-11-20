//
//  SavedProductsTests.swift
//  SavedProductsTests
//
//  Created by Moyses Miranda do Vale Azevedo on 18/11/24.
//

import XCTest
import FractalData
import CoreData
@testable import SavedProducts

class SavedProductsViewModelTests: XCTestCase {

    var viewModel: SavedProductsViewModel!
    var dataStoreMock: SavedProductsDataStoreMock!

    override func setUp() {
        super.setUp()
        
        dataStoreMock = SavedProductsDataStoreMock()
        viewModel = SavedProductsViewModel(dataStore: dataStoreMock)
    }

    override func tearDown() {
        viewModel = nil
        dataStoreMock = nil
        super.tearDown()
    }

    func testGetAllProductsSuccess() {
        let product1 = Products() // add mockContext
        product1.tag = "Tag"
        product1.product = "Product1"
        product1.productDescription = "Description"
        let mockProducts = [product1]
        dataStoreMock.mockedProducts = mockProducts

        let result = viewModel.getAllProducts()

        XCTAssertTrue(result)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.count, mockProducts.count)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.first?.product, "Product1")
    }

    func testGetAllProductsFailure() {
        dataStoreMock.mockedProducts = nil
        let result = viewModel.getAllProducts()
        XCTAssertFalse(result)
        XCTAssertNil(viewModel.cacheCollectionView.value)
    }
}
