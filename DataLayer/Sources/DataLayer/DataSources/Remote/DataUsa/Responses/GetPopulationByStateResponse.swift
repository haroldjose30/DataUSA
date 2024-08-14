//  Created by Harold José on 13/08/2024.

import Foundation

public struct GetPopulationByStateResponse: Codable {
    let data: [StateData]

    struct StateData: Codable {
        let idState, state: String
        let idYear: Int
        let year: String
        let population: Int
        let slugState: String

        enum CodingKeys: String, CodingKey {
            case idState = "ID State"
            case state = "State"
            case idYear = "ID Year"
            case year = "Year"
            case population = "Population"
            case slugState = "Slug State"
        }
    }
}
