//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer

extension GetPopulationByStateResponse.StateData {
    func toDTO() -> StateDTO {
        return StateDTO(
            idState: self.idState,
            state: self.state,
            year: self.idYear,
            population: self.population,
            coordinate: nil
        )
    }
}

extension Array where Element == GetPopulationByStateResponse.StateData {
    func toDTO() -> [StateDTO] {
        self.map { $0.toDTO() }
    }
}
