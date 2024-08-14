//  Created by Harold José on 14/08/2024.

import Foundation
import CoreLayer

@MainActor
class MainViewModel: ObservableObject {

    @Published var items: [MainMenuItemModel] = []
    @Published var title: String = ""
    @Published var subtitle: String = ""

    func loadInitialState() async throws {
        self.items = [
            MainMenuItemModel(
                id: .populationFromNationByYear,
                title: "Population by Year",
                subtitle: "from USA",
                systemImage: AppConstants.ImageName.chart_xyaxis_line.rawValue
            ),
            MainMenuItemModel(
                id: .populationByState,
                title: "Population by State",
                subtitle: "from USA filtered by year",
                systemImage: AppConstants.ImageName.chart_bar.rawValue
            ),
        ]

        self.title = "from datausa.io"
        self.subtitle = formatDate()
    }

    private func formatDate(date: Date = Date()) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}
