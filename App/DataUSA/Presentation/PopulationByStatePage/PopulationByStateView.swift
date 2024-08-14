//  Created by Harold José on 14/08/2024.

import Foundation

import SwiftUI
import CoreLayer
import DomainLayer
import Charts

struct PopulationByStateView: View {
    @StateObject var viewModel: PopulationByStateViewModel
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .loading:
                LoadingView()
            case .success(let items):
                SuccessView(items: items)
            case .error(let message):
                ErrorView(message: message)
            }
        }.onAppear {
            Task {
                await viewModel.loadData()
            }
        }
    }

    //MARK: - Success View

    func SuccessView(items: [StateModel]) -> some View {
        VStack {
            Picker("Choose a year",
                   selection: $viewModel.selectedYear,
                   content: {
                ForEach(viewModel.years, id: \.self) {
                    Text($0)
                }
            })
            TabView {
                TabChartView(items: items)
                    .tabItem {
                        Label("Chart", systemImage: AppConstants.ImageName.chart_bar.rawValue)
                    }
                TabDataView(items: items)
                    .tabItem {
                        Label("Data", systemImage: AppConstants.ImageName.list_bullet_below_rectangle.rawValue)
                    }
            }
        }
    }

    //MARK: - TabChart View

    func TabChartView(items: [StateModel]) -> some View {
        let minPopulation = items.map(\.population).min() ?? 0
        let maxPopulation = items.map(\.population).max() ?? 0

        return Chart(items) { item in
            BarMark(
                x: .value("State", item.state),
                y: .value("Population", item.population)
            ).foregroundStyle(by: .value("State", item.state))
        }
        .chartYScale(domain: minPopulation...maxPopulation)
        .chartYAxis {
            AxisMarks(values: .automatic) { value in
                if let population = value.as(Int.self) {
                    if population > 1_000_000 {
                        AxisValueLabel("\(population / 1_000_000)M")
                    } else {
                        AxisValueLabel("\(population / 1_000)K")
                    }
                    AxisGridLine()
                    AxisTick()
                }
            }
        }.padding(24)
    }

    //MARK: - TabData View

    func TabDataView(items: [StateModel]) -> some View {
        VStack {
            List(items) { item in
                HStack {
                    Text(item.state)
                    Spacer()
                    Text(item.population, format: .number)
                }
            }
        }
    }

    //MARK: - Error View

    func ErrorView(message: String) -> some View {
        VStack {
            Text(message)
            Button(viewModel.buttonRetryTitle) {
                Task {
                    await viewModel.loadData()
                }
            }
        }
    }

    //MARK: - Loading View

    func LoadingView() -> some View {
        ProgressView()
    }
}



#Preview("Success") {
    let viewModel = PopulationByStateViewModel(
        viewState: .success(items: StateModel.mock)
    )
    return PopulationByStateView(viewModel: viewModel)
}


#Preview("loading") {
    let viewModel = PopulationByStateViewModel(
        viewState: .loading
    )
    return PopulationByStateView(viewModel: viewModel)
}

#Preview("error") {
    let viewModel = PopulationByStateViewModel(
        viewState: .error(message: "Error Message")
    )
    return PopulationByStateView(viewModel: viewModel)
}


