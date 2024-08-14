//  Created by Harold José on 13/08/2024.

import Foundation

public struct StateModel: Identifiable {
    public init(idState: String, state: String, year: Int, population: Int, coordinate: Coordinate? = nil) {
        self.idState = idState
        self.state = state
        self.year = year
        self.population = population
        self.coordinate = coordinate
    }
    
    public let id: UUID = UUID()
    public let idState: String
    public let state: String
    public let year: Int
    public let population: Int
    public let coordinate: Coordinate?
}

public extension StateModel {
    static var mock: [StateModel] = [
        StateModel(idState: "1", state: "Acre", year: 2020, population: 1_000_000),
        StateModel(idState: "2", state: "Alagoas", year: 2020, population: 2_000_000),
        StateModel(idState: "3", state: "Amapá", year: 2020, population: 3_000_000),
        StateModel(idState: "4", state: "Amazonas", year: 2020, population: 4_000_000),
        StateModel(idState: "5", state: "Bahia", year: 2020, population: 5_000_000),
        StateModel(idState: "6", state: "Ceará", year: 2020, population: 6_000_000),
        StateModel(idState: "7", state: "Distrito Federal", year: 2020, population: 7_000_000),
        StateModel(idState: "8", state: "Espírito Santo", year: 2020, population: 8_000_000),
        StateModel(idState: "9", state: "Goiás", year: 2020, population: 9_000_000),
        StateModel(idState: "10", state: "Maranhão", year: 2020, population: 10_000_000),
        StateModel(idState: "11", state: "Mato Grosso", year: 2020, population: 11_000_000),
        StateModel(idState: "12", state: "Mato Grosso do Sul", year: 2020, population: 12_000_000),
        StateModel(idState: "13", state: "Minas Gerais", year: 2020, population: 13_000_000),
        StateModel(idState: "14", state: "Pará", year: 2020, population: 14_000_000),
        StateModel(idState: "15", state: "Paraíba", year: 2020, population: 15_000_000),
        StateModel(idState: "16", state: "Paraná", year: 2020, population: 16_000_000),
        StateModel(idState: "17", state: "Pernambuco", year: 2020, population: 17_000_000),
        StateModel(idState: "18", state: "Piauí", year: 2020, population: 18_000_000),
        StateModel(idState: "19", state: "Rio de Janeiro", year: 2020, population: 19_000_000),
        StateModel(idState: "20", state: "Rio Grande do Norte", year: 2020, population: 20_000_000),
        StateModel(idState: "21", state: "Rio Grande do Sul", year: 2020, population: 21_000_000),
        StateModel(idState: "22", state: "Rondônia", year: 2020, population: 22_000_000),
        StateModel(idState: "23", state: "Roraima", year: 2020, population: 23_000_000),
    ]
}
