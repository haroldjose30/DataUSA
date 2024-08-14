//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer

public class GetPopulationFromNationByYearUseCase: GetPopulationFromNationByYearUseCaseProtocol {
    public init(repository: DataUsaRepositoryProtocol) {
        self.repository = repository
    }

    private let repository: DataUsaRepositoryProtocol

    public func execute() async throws -> [NationModel] {
        try await repository.getPopulationFromNationByYear().toModel()
    }
}
