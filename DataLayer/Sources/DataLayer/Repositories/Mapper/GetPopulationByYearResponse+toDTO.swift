//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer

extension GetPopulationByYearResponse.NationData {
    func toDTO() -> NationDTO {
        return NationDTO(
            idNation: self.idNation,
            nation: self.nation,
            year: self.idYear,
            population: self.population
        )
    }
}

extension Array where Element == GetPopulationByYearResponse.NationData {
    func toDTO() -> [NationDTO] {
        self.map { $0.toDTO() }
    }
}
