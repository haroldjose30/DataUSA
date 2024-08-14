//  Created by Harold José on 14/08/2024.

import Foundation
import UIKit
import CoreLayer
import DependecyInjection

class PopulationByStateCoordinator: CoordinatorProtocol {
    init(
        navigationController: UINavigationController
    ) {
        self.navigationController = navigationController
    }

    private(set) var childCoordinators: [CoordinatorProtocol] = []

    var navigationController: UINavigationController

    func start(animated: Bool) {
        if let vm: PopulationByStateViewModel = try? DIContainer.shared.resolve(type: PopulationByStateViewModel.self) {
            let view = PopulationByStateView(viewModel: vm)
            let vc = PopulationByStateViewController(rootView: view)
            navigationController.pushViewController(vc, animated: animated)
        }
    }
}
