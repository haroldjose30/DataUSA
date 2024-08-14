//  Created by Harold José on 13/08/2024.

import Foundation
@testable import DataLayer

extension GetPopulationByStateResponse {
    static func fixture(data: [StateData] = [.fixture()]) -> GetPopulationByStateResponse {
        GetPopulationByStateResponse(data: data)
    }
}

extension GetPopulationByStateResponse.StateData {
    static func fixture(
        idState: String = "04000US01",
        state: String = "Alabama",
        idYear: Int = 2020,
        year: String = "2020",
        population: Int = 4903185,
        slugState: String = "alabama"
    ) -> GetPopulationByStateResponse.StateData {
        GetPopulationByStateResponse.StateData(
            idState: idState,
            state: state,
            idYear: idYear,
            year: year,
            population: population,
            slugState: slugState
        )
    }
}
