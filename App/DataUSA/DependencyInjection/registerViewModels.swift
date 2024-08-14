//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer
import DependecyInjection

extension DIContainer {

    @MainActor
    static func registerViewModels() {

        shared.register(type: MainViewModel.self) { container in
            MainViewModel()
        }

        shared.register(type: PopulationFromNationByYearViewModel.self) { container in
            PopulationFromNationByYearViewModel(
                getPopulationFromNationByYearUseCase: try container.resolve(type: GetPopulationFromNationByYearUseCaseProtocol.self)
            )
        }

        shared.register(type: PopulationByStateViewModel.self) { container in
            PopulationByStateViewModel(
                getPopulationByStateUseCase: try container.resolve(type: GetPopulationByStateUseCaseProtocol.self)
            )
        }
    }
}
