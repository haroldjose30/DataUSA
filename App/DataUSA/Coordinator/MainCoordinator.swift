//  Created by Harold José on 13/08/2024.

import Foundation
import UIKit
import DependecyInjection

/// This is simplifyed implementation of Coordinator pattern
class MainCoordinator: CoordinatorProtocol {
    private(set) var childCoordinators: [CoordinatorProtocol] = []

    let navigationController: UINavigationController

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
    }

    var window: UIWindow?
    func start(animated: Bool) {

        let mainViewController = MainViewController()
        mainViewController.viewModel = try? DIContainer.shared.resolve(type: MainViewModel.self)
        mainViewController.goToDetail = { [weak self] item in

            //TODO: implement to dispose childCoordinator when finished to avoid retain memory
            guard let self else { return }
            switch item {
            case .populationFromNationByYear:
                let childCoordinator = PopulationFromNationByYearCoordinator(
                    navigationController: self.navigationController
                )
                self.childCoordinators.append(childCoordinator)
                childCoordinator.start(animated: true)

            case .populationByState:
                let childCoordinator = PopulationByStateCoordinator(
                    navigationController: self.navigationController
                )
                self.childCoordinators.append(childCoordinator)
                childCoordinator.start(animated: true)
            }
        }

        navigationController.pushViewController(mainViewController, animated: animated)

        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
