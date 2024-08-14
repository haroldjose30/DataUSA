//  Created by Harold José on 13/08/2024.

import Foundation

public protocol DataUsaRepositoryProtocol {
    func getPopulationFromNationByYear() async throws -> [NationDTO]
    func getPopulationByState(year: Int?) async throws -> [StateDTO]
}
