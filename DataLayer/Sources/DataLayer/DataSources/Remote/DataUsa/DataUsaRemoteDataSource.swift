//  Created by Harold José on 13/08/2024.

import Foundation
import AJHttpClient
import Combine
import CoreLayer

public class DataUsaRemoteDataSource: DataUsaRemoteDataSourceProtocol {

    public init(httpClient: AJHttpClientType) {
        self.httpClient = httpClient
    }

    private let httpClient: AJHttpClientType
    private var cancellables: Set<AnyCancellable> = []

    public func getPopulationFromNationByYear() async throws -> GetPopulationByYearResponse {

        //TODO: change AJHttpClient from combine to structured concurrency (async/await)
        return try await withCheckedThrowingContinuation { continuation in
            let request = GetPopulationByYearRequest()
            httpClient.send(request)
                .asJson()
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            continuation.resume(throwing: self.mapToDataLayerError(error))
                        }
                    },
                    receiveValue: { response in
                        continuation.resume(with: .success(response))
                    })
                .store(in: &cancellables)
        }
    }

    public func getPopulationByState(year: Int?) async throws -> GetPopulationByStateResponse {

        //TODO: change AJHttpClient from combine to structured concurrency (async/await)
        return try await withCheckedThrowingContinuation { continuation in
            let request = GetPopulationByStateRequest(year: year)
            httpClient.send(request)
                .asJson()
                .sink(
                    receiveCompletion: { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            continuation.resume(throwing: self.mapToDataLayerError(error))
                        }
                    },
                    receiveValue: { response in
                        continuation.resume(with: .success(response))
                    })
                .store(in: &cancellables)
        }
    }
}

private extension DataUsaRemoteDataSource {
    
    func mapToDataLayerError(_ error: Error) -> DataLayerError {
        guard let httpError = error as? AJHttpError else {
            return DataLayerError.unknown
        }

        return switch httpError {
        case .encodingError:
            DataLayerError.encodingError
        case .decodingError(let message):
            DataLayerError.decodingError(message)
        case .badRequest:
            DataLayerError.badRequest
        case .serverError:
            DataLayerError.serverError
        case .unauthorized:
            DataLayerError.unauthorized
        case .unknown:
            DataLayerError.unknown
        case .urlMalFormmed:
            DataLayerError.urlMalFormmed
        case .forbidden:
            DataLayerError.forbidden
        case .notFound:
            DataLayerError.notFound
        }
    }
}
