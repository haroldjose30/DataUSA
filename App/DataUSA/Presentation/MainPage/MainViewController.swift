//  Created by Harold José on 14/08/2024.

import UIKit
import CoreLayer
import DataLayer
import DomainLayer
import Combine

class MainViewController: UIViewController {

    private lazy var mainView: MainView = {
        return MainView()
    }()

    var viewModel: MainViewModel?
    var goToDetail: ((MainMenuItemModel.Identifier) -> Void)?

    private var cancellable = Set<AnyCancellable>()

    override func loadView() {
        super.loadView()
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Report Options"
        setupObservables()
        mainView.setupLoading { [weak self] in
            do {
                try await self?.viewModel?.loadInitialState()
            } catch {
                print("error \(error)")
            }
        }
    }

    func setupObservables() {
        //Update view when itens from ViewModel is updated
        self.viewModel?.$items
            .sink { [weak self] items in
                self?.mainView.setup(items: items)
            }
            .store(in: &cancellable)

        self.viewModel?.$title
            .sink { [weak self] title in
                self?.mainView.setup(title: title)
            }
            .store(in: &cancellable)

        self.viewModel?.$subtitle
            .sink { [weak self] subtitle in
                self?.mainView.setup(subtitle: subtitle)
            }
            .store(in: &cancellable)

        //Call goToDetail When a item is selected in view
        self.mainView.$selectedItem
            .sink {  [weak self] item in
                guard let item else { return }
                self?.goToDetail?(item.id)
            }
            .store(in: &cancellable)
    }
}
