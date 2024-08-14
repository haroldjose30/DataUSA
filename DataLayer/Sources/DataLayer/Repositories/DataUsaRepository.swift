//  Created by Harold José on 13/08/2024.

import Foundation
import CoreLayer

public class DataUsaRepository: DataUsaRepositoryProtocol {
    
    public init(remoteDataSource: DataUsaRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }

    private let remoteDataSource: DataUsaRemoteDataSourceProtocol

    public func getPopulationFromNationByYear() async throws -> [NationDTO] {
        try await remoteDataSource.getPopulationFromNationByYear().data.toDTO()
    }

    public func getPopulationByState(year: Int?) async throws -> [StateDTO] {
        try await remoteDataSource.getPopulationByState(year: year).data.toDTO()
    }
}
