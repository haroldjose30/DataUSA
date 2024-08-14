//  Created by Harold José on 13/08/2024.

import Foundation

public protocol DataUsaRemoteDataSourceProtocol {
    func getPopulationFromNationByYear() async throws -> GetPopulationByYearResponse
    func getPopulationByState(year: Int?) async throws -> GetPopulationByStateResponse
}
