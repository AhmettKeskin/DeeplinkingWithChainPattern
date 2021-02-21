//
//  DeeplinkManager.swift
//  DeeplinkingWithChainPattern
//
//  Created by Ahmet Keskin on 21.02.2021.
//

import UIKit

class DeeplinkManager {
    static let shared: DeeplinkManager = DeeplinkManager()
    
    private init() {}
    
    private let items: [DeeplinkableItem] = [ProductDetailDeeplinkItem(),
                                             OrderDetailDeeplinkItem()]
    
    func navigate(with params: [String: Any]) {
        guard let window = UIApplication.shared.windows.first else { return }
        items.first(where: { $0.isSatisfied(by: params)})?.execute(window, params: params)
    }
}
