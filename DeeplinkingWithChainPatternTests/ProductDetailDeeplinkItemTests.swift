//
//  ProductDetailDeeplinkItemTests.swift
//  DeeplinkingWithChainPatternTests
//
//  Created by Ahmet Keskin on 22.02.2021.
//

import XCTest
@testable import DeeplinkingWithChainPattern

class ProductDetailDeeplinkItemTests: XCTestCase {
    
    var item: ProductDetailDeeplinkItem!
    
    override func setUp() {
        self.item = ProductDetailDeeplinkItem()
    }
    
    func test_isSatisfied_ProductIdExist_ShouldReturnTrue() {
        let params = ["productId": "123"]
        XCTAssertTrue(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_ProductIdNotExist_ShouldReturnFalse() {
        let params = ["ahmet": "123"]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_ProductIdEmpty_ShouldReturnFalse() {
        let params = ["productId": ""]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_execute_ProductIdExist_ProductDetailPagePushedProperly() {
        let params = ["productId": "123"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 1)
        XCTAssertTrue(navigationStackVCs?.last is ProductDetailViewController)
        XCTAssertEqual((navigationStackVCs?.last as? ProductDetailViewController)?.productId, "123")
    }
    
    func test_execute_ProductIdNotExist_NavigationStackShouldBeNil() {
        let params = ["ahmet": "asdasdasd"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
    
    func test_execute_ProductIdIsEmpty_NavigationStackShouldBeNil() {
        let params = ["productId": ""]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
}
