//  Created by Harold José on 13/08/2024.

import Foundation

public extension NationDTO {
    func toModel() -> NationModel {
        NationModel(
            idNation: self.idNation,
            nation: self.nation,
            year: self.year,
            population: self.population
        )
    }
}

public extension Array where Element == NationDTO {
    func toModel() -> [NationModel] {
        self.map { $0.toModel() }
    }
}
