//
//  OrderDetailDeeplinkItemTests.swift
//  DeeplinkingWithChainPatternTests
//
//  Created by Ahmet Keskin on 22.02.2021.
//

import XCTest
@testable import DeeplinkingWithChainPattern

class OrderDetailDeeplinkItemTests: XCTestCase {
    
    var item: OrderDetailDeeplinkItem!
    
    override func setUp() {
        self.item = OrderDetailDeeplinkItem()
    }
    
    func test_isSatisfied_OrderIdExist_ShouldReturnTrue() {
        let params = ["orderId": "123"]
        XCTAssertTrue(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_OrderIdNotExist_ShouldReturnFalse() {
        let params = ["ahmet": "123"]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_isSatisfied_OrderIdEmpty_ShouldReturnFalse() {
        let params = ["orderId": ""]
        XCTAssertFalse(item.isSatisfied(by: params))
    }
    
    func test_execute_OrderIdExist_OrderDetailPagePushedProperly() {
        let params = ["orderId": "123"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 1)
        XCTAssertTrue(navigationStackVCs?.last is OrderDetailViewController)
        XCTAssertEqual((navigationStackVCs?.last as? OrderDetailViewController)?.orderId, "123")
    }
    
    func test_execute_OrderIdNotExist_NavigationStackShouldBeNil() {
        let params = ["ahmet": "asdasdasd"]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
    
    func test_execute_OrderIdIsEmpty_NavigationStackShouldBeNil() {
        let params = ["orderId": ""]
        let window = UIWindow()
        window.rootViewController = UINavigationController()
        
        item.execute(window, params: params)
        
        let navigationStackVCs = (window.rootViewController as? UINavigationController)?.viewControllers
        
        XCTAssertEqual(navigationStackVCs?.count, 0)
    }
}
