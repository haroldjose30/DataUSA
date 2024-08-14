//  Created by Harold José on 14/08/2024.

import Foundation
import UIKit
import CoreLayer
import DomainLayer

class MainView: UIView {

    @Published var selectedItem: MainMenuItemModel?

    private lazy var list: UICollectionView = {
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        let view = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        view.register(UICollectionViewListCell.self, forCellWithReuseIdentifier: "cell_id")
        view.dataSource = self
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        view.allowsSelection = true
        view.allowsMultipleSelection = false
        return view
    }()

    private lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return view
    }()

    private lazy var subtitle: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return view
    }()

    private lazy var activity: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var items: [MainMenuItemModel] = []

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLoading(longProcess: @escaping () async throws -> Void) {
        UIView.animate(withDuration: 1, animations: {
            self.list.isHidden = true
            self.activity.startAnimating()
        }) { _ in
            Task {
                try await longProcess()
                await MainActor.run {
                    UIView.animate(withDuration: 1, animations: {
                        self.list.isHidden = false
                        self.activity.stopAnimating()
                    })
                }
            }
        }
    }

    func setup(items: [MainMenuItemModel]) {
        self.items = items
        self.list.reloadData()
        self.list.isHidden = false
    }

    func setup(title: String) {
        self.title.text = title
    }

    func setup(subtitle: String) {
        self.subtitle.text = subtitle
    }
}

extension MainView: ViewCodeConformanceProtocol {
    func setupHierarchy() {
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(list)
        self.addSubview(activity)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            list.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            list.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            list.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            list.bottomAnchor.constraint(equalTo: title.topAnchor),
        ])

        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            title.bottomAnchor.constraint(equalTo: subtitle.topAnchor)
        ])

        NSLayoutConstraint.activate([
            subtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
        ])

        NSLayoutConstraint.activate([
            activity.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activity.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

    func setupStyle() {
        backgroundColor = .white
    }
}

extension MainView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.item]
        let cell = list.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as? UICollectionViewListCell
        var content = cell?.defaultContentConfiguration()
        content?.text = item.title
        content?.secondaryText = item.subtitle
        content?.image = UIImage(systemName: item.systemImage)
        cell?.contentConfiguration = content
        return cell ?? UICollectionViewListCell()
    }
}

extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedItem = items[indexPath.item]
    }
}

import SwiftUI
#Preview {
    let view = MainView()
    view.setup(items: [
        MainMenuItemModel(
            id: .populationFromNationByYear,
            title: "title 1",
            subtitle: "subtitle 1",
            systemImage: AppConstants.ImageName.chart_xyaxis_line.rawValue
        ),
        MainMenuItemModel(
            id: .populationByState,
            title: "title 2",
            subtitle: "subtitle 2",
            systemImage: AppConstants.ImageName.chart_bar.rawValue
        ),
    ])
    view.setup(title: "Main Title")
    view.setup(subtitle: "Main Subtitle")
    return PreviewContainer {
        view
    }
}

