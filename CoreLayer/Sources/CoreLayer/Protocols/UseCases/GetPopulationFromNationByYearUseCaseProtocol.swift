//  Created by Harold José on 13/08/2024.

import Foundation

public protocol GetPopulationFromNationByYearUseCaseProtocol {
    func execute() async throws -> [NationModel]
}
