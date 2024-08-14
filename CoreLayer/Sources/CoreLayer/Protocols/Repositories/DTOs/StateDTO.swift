//  Created by Harold José on 13/08/2024.

import Foundation

public struct StateDTO {

    public init(idState: String, state: String, year: Int, population: Int, coordinate: Coordinate?) {
        self.idState = idState
        self.state = state
        self.year = year
        self.population = population
        self.coordinate = coordinate
    }
    
    let idState: String
    let state: String
    let year: Int
    let population: Int
    let coordinate: Coordinate?
}

extension StateDTO: Equatable {
    public static func == (lhs: StateDTO, rhs: StateDTO) -> Bool {
        lhs.idState == rhs.idState &&
        lhs.state == rhs.state &&
        lhs.year == rhs.year &&
        lhs.population == rhs.population &&
        lhs.coordinate?.latitude == rhs.coordinate?.latitude &&
        lhs.coordinate?.longitude == rhs.coordinate?.longitude
    }
}
