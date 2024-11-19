//
//  CoordinatorTests.swift
//  CoordinatorTests
//
//  Created by Moyses Miranda do Vale Azevedo on 13/11/24.
//

import XCTest
@testable import Coordinator
import CoreData
import DesignSystem
import Home
import SavedProducts
import ProductDetails

final class MainCoordinatorTests: XCTestCase {
    func test_init() {
        let navController = UINavigationController()
        let mockContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        let coordinator = MainCoordinator(nav: navController, coreDataContext: mockContext)

        XCTAssertEqual(coordinator.nav, navController)
        XCTAssertEqual(coordinator.coreDataContext, mockContext)
    }

    func test_start_should_HomeViewControllerInFirstView() {
        let navController = UINavigationController()
        let coordinator = MainCoordinator(nav: navController)
        coordinator.start()

        XCTAssertEqual(navController.viewControllers.count, 1)
        XCTAssertTrue(navController.viewControllers.first is HomeViewController)
    }

    func test_showGalery_should_SavedProductsViewControllerInLastView() {
        let navController = UINavigationController()
        let coordinator = MainCoordinator(nav: navController)

        coordinator.showGalery()

        XCTAssertEqual(navController.viewControllers.count, 1)
        XCTAssertTrue(navController.viewControllers.last is SavedProductsViewController)
    }

    func test_showDetailsView_should_ProductDetailsViewControllerInLastView() {
        let navController = UINavigationController()
        let mockProduct = FactoryMocksProducts.makeProductModel()
        let coordinator = MainCoordinator(nav: navController)

        coordinator.showDetailsView(mockProduct)

        XCTAssertEqual(navController.viewControllers.count, 1)
        XCTAssertTrue(navController.viewControllers.last is ProductDetailsViewController)
    }
}
