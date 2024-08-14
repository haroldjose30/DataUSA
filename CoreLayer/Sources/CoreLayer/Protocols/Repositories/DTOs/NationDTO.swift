//  Created by Harold José on 13/08/2024.

import Foundation

public struct NationDTO: Equatable {
    public init(idNation: String, nation: String, year: Int, population: Int) {
        self.idNation = idNation
        self.nation = nation
        self.year = year
        self.population = population
    }
    
    let idNation: String
    let nation: String
    let year: Int
    let population: Int
}
