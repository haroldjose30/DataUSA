//  Created by Harold José on 13/08/2024.

import Foundation

public protocol GetPopulationByStateUseCaseProtocol {
    func execute(year: Int?) async throws -> [StateModel]
}
