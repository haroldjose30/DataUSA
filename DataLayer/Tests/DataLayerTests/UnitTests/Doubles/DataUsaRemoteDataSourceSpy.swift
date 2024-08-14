//  Created by Harold José on 13/08/2024.

import Foundation
@testable import DataLayer

class DataUsaRemoteDataSourceSpy: DataUsaRemoteDataSourceProtocol {
    
    private(set) var getPopulationFromNationByYearCalled = false
    var getPopulationFromNationByYearReturn: GetPopulationByYearResponse = .fixture()

    func getPopulationFromNationByYear() async throws -> GetPopulationByYearResponse {
        getPopulationFromNationByYearCalled = true
        return getPopulationFromNationByYearReturn
    }
    
    private(set) var getPopulationByStateCalled = false
    private(set) var getPopulationByStateReceivedYear: Int?
    var getPopulationByStateReturn: GetPopulationByStateResponse = .fixture()
    func getPopulationByState(year: Int?) async throws -> GetPopulationByStateResponse {
        getPopulationByStateCalled = true
        getPopulationByStateReceivedYear = year
        return getPopulationByStateReturn
    }
}
