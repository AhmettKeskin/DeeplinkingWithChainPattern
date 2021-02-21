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
        guard let orderId = params["orderId"] as? String, !orderId.isEmpty else { return false }
        return true
    }
    
    func execute(_ window: UIWindow, params: [String : Any]) {
        guard let orderId = params["orderId"] as? String, !orderId.isEmpty else { return }
        let orderDetail = UIStoryboard(name: "Main",
                                         bundle: nil).instantiateViewController(withIdentifier: "OrderDetailViewController") as! OrderDetailViewController
        orderDetail.orderId = orderId
        let navigationController = window.rootViewController as? UINavigationController
        navigationController?.pushViewController(orderDetail,
                                                 animated: true)
    }
}

/*
    chain-pattern://?orderId=123
*/
