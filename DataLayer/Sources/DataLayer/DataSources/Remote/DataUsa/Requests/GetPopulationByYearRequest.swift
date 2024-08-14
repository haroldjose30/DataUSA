//  Created by Harold José on 13/08/2024.

import Foundation
import AJHttpClient

struct GetPopulationByYearRequest: AJHttpRequestGetJson {
    typealias ResponseType = GetPopulationByYearResponse
    var queryParameters: AJHttpQueryParameters = [:]
    var urlBase: String
    var path: String
    var headers: AJHttpHeaders = [:]

    init() {
        self.headers = ["Content-Type": "application/json"]

        self.queryParameters = [
            "drilldowns": "Nation",
            "measures": "Population"
        ]

        self.urlBase = DataUsaEndpoint.baseUrl
        self.path = DataUsaEndpoint.data
    }
}
