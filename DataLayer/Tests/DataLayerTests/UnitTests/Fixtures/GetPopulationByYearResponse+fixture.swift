//  Created by Harold José on 13/08/2024.

import Foundation
@testable import DataLayer

extension GetPopulationByYearResponse {
    static func fixture(
        data: [GetPopulationByYearResponse.NationData] = [.fixture()]
    ) -> GetPopulationByYearResponse {
        GetPopulationByYearResponse(data: data)
    }
}

extension GetPopulationByYearResponse.NationData {
    static func fixture(
        idNation: String = "01000US",
        nation: String = "United States",
        idYear: Int = 2022,
        year: String = "2022",
        population: Int = 331097593,
        slugNation: String = "united-states"
    ) -> GetPopulationByYearResponse.NationData {
        GetPopulationByYearResponse.NationData(
            idNation: idNation,
            nation: nation,
            idYear: idYear,
            year: year,
            population: population,
            slugNation: slugNation
        )
    }
}
