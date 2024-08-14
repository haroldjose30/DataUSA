//
//  CoordinatorProtocol.swift
//  DataUSA
//
//  Created by Harold José on 13/08/2024.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get }
    func start(animated: Bool)
}
