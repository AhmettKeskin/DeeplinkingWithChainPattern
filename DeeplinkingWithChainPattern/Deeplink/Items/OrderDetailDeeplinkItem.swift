//
//  OrderDetailDeeplinkItem.swift
//  DeeplinkingWithChainPattern
//
//  Created by Ahmet Keskin on 21.02.2021.
//

import Foundation
import UIKit

struct OrderDetailDeeplinkItem: DeeplinkableItem {
    func isSatisfied(by params: [String : Any]) -> Bool {
        guard let productId = params["orderId"] as? String, !productId.isEmpty else { return false }
        return true
    }
    
    func execute(_ window: UIWindow, params: [String : Any]) {
        guard let productId = params["orderId"] as? String, !productId.isEmpty else { return }
        let productDetail = UIStoryboard(name: "Main",
                                         bundle: nil).instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        let homepage = window.rootViewController as? HomepageViewController
        homepage?.navigationController?.pushViewController(productDetail,
                                                           animated: true)
    }
}
