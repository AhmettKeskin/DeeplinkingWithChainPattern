//
//  DeeplinkableItem.swift
//  DeeplinkingWithChainPattern
//
//  Created by Ahmet Keskin on 21.02.2021.
//

import Foundation
import UIKit

protocol DeeplinkableItem {
    func isSatisfied(by params: [String: Any]) -> Bool
    func execute(_ window: UIWindow, params: [String: Any])
}
