//  Created by Harold José on 13/08/2024.

import Foundation

public extension StateDTO {
    func toModel() -> StateModel {
        StateModel(
            idState: self.idState,
            state: self.state,
            year: self.year,
            population: self.population,
            coordinate: self.coordinate
        )
    }
}

public extension Array where Element == StateDTO {
    func toModel() -> [StateModel] {
        self.map { $0.toModel() }
    }
}
