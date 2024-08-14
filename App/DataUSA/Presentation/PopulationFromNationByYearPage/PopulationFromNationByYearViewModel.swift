//  Created by Harold José on 14/08/2024.

import Foundation
import CoreLayer

@MainActor
class PopulationFromNationByYearViewModel: ObservableObject {

    init(
        getPopulationFromNationByYearUseCase: GetPopulationFromNationByYearUseCaseProtocol? = nil,
        viewState: PopulationFromNationByYearViewState = .loading
    ) {
        self.getPopulationFromNationByYearUseCase = getPopulationFromNationByYearUseCase
        self.viewState = viewState
    }
    
    private let getPopulationFromNationByYearUseCase: GetPopulationFromNationByYearUseCaseProtocol?

    @Published var viewState: PopulationFromNationByYearViewState = .loading
    let buttonRetryTitle: String = "Retry"

    func loadData() async {
        guard let getPopulationFromNationByYearUseCase else { return }
        do {
            self.viewState = .loading
            let items = try await getPopulationFromNationByYearUseCase.execute()
            self.viewState = .success(items: items)
        } catch {
            self.viewState = .error(message: "Something went wrong. Please try again.")
        }
    }
}

enum PopulationFromNationByYearViewState {
    case loading
    case success(items: [NationModel])
    case error(message: String)
}
