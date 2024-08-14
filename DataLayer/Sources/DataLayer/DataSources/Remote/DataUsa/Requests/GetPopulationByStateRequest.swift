//  Created by Harold José on 13/08/2024.

import Foundation
import AJHttpClient

struct GetPopulationByStateRequest: AJHttpRequestGetJson {
    typealias ResponseType = GetPopulationByStateResponse
    var queryParameters: AJHttpQueryParameters = [:]
    var urlBase: String
    var path: String
    var headers: AJHttpHeaders = [:]

    init(year: Int?) {

        let yearFilter = if let year {
           "\(year)"
        } else {
            "latest"
        }

        self.headers = ["Content-Type": "application/json"]
        self.queryParameters = [
            "drilldowns": "State",
            "measures": "Population",
            "year": "\(yearFilter)",
        ]

        //static let nation = "drilldowns=Nation&measures=Population"

        self.urlBase = DataUsaEndpoint.baseUrl
        self.path = DataUsaEndpoint.data
    }
}
