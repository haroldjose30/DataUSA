//  Created by Harold José on 14/08/2024.

import Foundation
import CoreLayer

@MainActor
class PopulationByStateViewModel: ObservableObject {

    init(
        getPopulationByStateUseCase: GetPopulationByStateUseCaseProtocol? = nil,
        viewState: PopulationByStateViewState = .loading
    ) {
        self.getPopulationByStateUseCase = getPopulationByStateUseCase
        self.viewState = viewState
    }

    private let getPopulationByStateUseCase: GetPopulationByStateUseCaseProtocol?

    @Published var viewState: PopulationByStateViewState = .loading

    let years = ["2022", "2021", "2020", "2019", "2018", "2017", "2016", "2015", "2014", "2013"]
    @Published var selectedYear: String = "2022" {
        didSet {
            Task {
                await loadData()
            }
        }
    }

    let buttonRetryTitle: String = "Retry"

    func loadData() async {
        guard let getPopulationByStateUseCase else { return }
        do {
            self.viewState = .loading
            let items = try await getPopulationByStateUseCase.execute(year: Int(selectedYear))
            self.viewState = .success(items: items)
        } catch {
            self.viewState = .error(message: "Something went wrong. Please try again.")
        }
    }
}

enum PopulationByStateViewState {
    case loading
    case success(items: [StateModel])
    case error(message: String)
}
