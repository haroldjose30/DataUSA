//  Created by Harold José on 14/08/2024.

import Foundation

public enum DataLayerError: Error, Equatable {

    case encodingError
    case decodingError(String?)
    case badRequest
    case serverError
    case unauthorized
    case unknown
    case urlMalFormmed
    case forbidden
    case notFound
}
