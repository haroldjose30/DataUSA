//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer

public class GetPopulationByStateUseCase: GetPopulationByStateUseCaseProtocol {
    public init(repository: DataUsaRepositoryProtocol) {
        self.repository = repository
    }

    private let repository: DataUsaRepositoryProtocol

    public func execute(year: Int?) async throws -> [StateModel] {
        try await repository.getPopulationByState(year: year).toModel()
    }
}
