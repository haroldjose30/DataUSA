//
//  File.swift
//  
//
//  Created by Harold José on 13/08/2024.
//

import CoreLayer
import DomainLayer

extension DIContainer {

    static func registerUseCases() {

        shared.register(type: GetPopulationByStateUseCaseProtocol.self) { container in
            GetPopulationByStateUseCase(
                repository: try container.resolve(type: DataUsaRepositoryProtocol.self)
            )
        }

        shared.register(type: GetPopulationFromNationByYearUseCaseProtocol.self) { container in
            GetPopulationFromNationByYearUseCase(
                repository: try container.resolve(type: DataUsaRepositoryProtocol.self)
            )
        }
    }
}
