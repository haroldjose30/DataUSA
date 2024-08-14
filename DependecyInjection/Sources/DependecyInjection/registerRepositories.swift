//
//  File.swift
//  
//
//  Created by Harold José on 13/08/2024.
//

import CoreLayer
import DataLayer
import AJHttpClient

extension DIContainer {
    static func registerRepositories() {

        shared.register(type: AJHttpClientType.self) { _ in
            AJHttpClient()
        }

        shared.register(type: DataUsaRemoteDataSourceProtocol.self) { container in
            DataUsaRemoteDataSource(
                httpClient: try container.resolve(type: AJHttpClientType.self)
            )
        }

        shared.register(type: DataUsaRepositoryProtocol.self) { container in
            DataUsaRepository(
                remoteDataSource: try container.resolve(type: DataUsaRemoteDataSourceProtocol.self)
            )
        }
    }
}
