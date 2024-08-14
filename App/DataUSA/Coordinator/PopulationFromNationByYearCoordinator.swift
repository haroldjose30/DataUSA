//  Created by Harold José on 13/08/2024.

import Foundation
import UIKit
import CoreLayer
import DependecyInjection

class PopulationFromNationByYearCoordinator: CoordinatorProtocol {
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    private(set) var childCoordinators: [CoordinatorProtocol] = []

    var navigationController: UINavigationController

    func start(animated: Bool) {
        if let vm: PopulationFromNationByYearViewModel = try? DIContainer.shared.resolve(type: PopulationFromNationByYearViewModel.self) {
            let view = PopulationFromNationByYearView(viewModel: vm)
            let vc = PopulationFromNationByYearViewController(rootView: view)
            navigationController.pushViewController(vc, animated: animated)
        }
    }
}

