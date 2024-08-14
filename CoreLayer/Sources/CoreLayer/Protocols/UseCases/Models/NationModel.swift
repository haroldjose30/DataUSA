//  Created by Harold José on 13/08/2024.

import Foundation

public struct NationModel: Identifiable {
    public init(idNation: String, nation: String, year: Int, population: Int) {
        self.idNation = idNation
        self.nation = nation
        self.year = year
        self.population = population
    }
    
    public let id: UUID = UUID()
    public let idNation: String
    public let nation: String
    public let year: Int
    public let population: Int
}


public extension NationModel {
    static var mock: [NationModel] = [
        NationModel(idNation: "1", nation: "Brazil", year: 2020, population: 220_000_000),
        NationModel(idNation: "2", nation: "Brazil", year: 2021, population: 221_000_000),
        NationModel(idNation: "3", nation: "Brazil", year: 2022, population: 222_000_000),
        NationModel(idNation: "4", nation: "Brazil", year: 2023, population: 223_000_000),
        NationModel(idNation: "5", nation: "Brazil", year: 2024, population: 224_000_000),
    ]
}
