//  Created by Harold José on 13/08/2024.

public struct GetPopulationByYearResponse: Codable {
    let data: [NationData]

    struct NationData: Codable {
        let idNation: String
        let nation: String
        let idYear: Int
        let year: String
        let population: Int
        let slugNation: String

        enum CodingKeys: String, CodingKey {
            case idNation = "ID Nation"
            case nation = "Nation"
            case idYear = "ID Year"
            case year = "Year"
            case population = "Population"
            case slugNation = "Slug Nation"
        }
    }
}
