//
//  ProductDetailDeeplinkItem.swift
//  DeeplinkingWithChainPattern
//
//  Created by Ahmet Keskin on 21.02.2021.
//

import Foundation
import UIKit

struct ProductDetailDeeplinkItem: DeeplinkableItem {
    func isSatisfied(by params: [String : Any]) -> Bool {
        guard let productId = params["productId"] as? String, !productId.isEmpty else { return false }
        return true
    }
    
    func execute(_ window: UIWindow, params: [String : Any]) {
        guard let productId = params["productId"] as? String, !productId.isEmpty else { return }
        let productDetail = UIStoryboard(name: "Main",
                                         bundle: nil).instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
        productDetail.productId = productId
        let navigationController = window.rootViewController as? UINavigationController
        navigationController?.pushViewController(productDetail,
                                                 animated: true)
    }
}

/*
    chain-pattern://?productId=123
*/
