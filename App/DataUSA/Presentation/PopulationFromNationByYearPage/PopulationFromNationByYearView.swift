//  Created by Harold José on 14/08/2024.

import Foundation

import SwiftUI
import CoreLayer
import DomainLayer
import Charts

struct PopulationFromNationByYearView: View {
    @StateObject var viewModel: PopulationFromNationByYearViewModel
    var body: some View {
        Group {
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

    func SuccessView(items: [NationModel]) -> some View {
        VStack {
            TabView {
                TabChartView(items: items)
                    .tabItem {
                        Label("Chart", systemImage: AppConstants.ImageName.chart_xyaxis_line.rawValue)
                    }
                TabDataView(items: items)
                    .tabItem {
                        Label("Data", systemImage: AppConstants.ImageName.list_bullet_below_rectangle.rawValue)
                    }
            }
        }
    }

    //MARK: - TabChart View

    func TabChartView(items: [NationModel]) -> some View {
        let minYear = items.map(\.year).min() ?? 0
        let maxYear = items.map(\.year).max() ?? 0
        let minPopulation = items.map(\.population).min() ?? 0
        let maxPopulation = items.map(\.population).max() ?? 0

        return Chart(items) { item in
            LineMark(
                x: .value("Year", item.year),
                y: .value("Population", item.population)
            )

            PointMark(
                x: .value("Year", item.year),
                y: .value("Population", item.population)
            )
        }
        .chartXScale(domain: minYear...maxYear)
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

    func TabDataView(items: [NationModel]) -> some View {
        VStack {
            List(items) { item in
                HStack {
                    Text(item.year, format: .number)
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
    let viewModel = PopulationFromNationByYearViewModel(
        viewState: .success(items: NationModel.mock)
    )
    return PopulationFromNationByYearView(viewModel: viewModel)
}


#Preview("loading") {
    let viewModel = PopulationFromNationByYearViewModel(
        viewState: .loading
    )
    return PopulationFromNationByYearView(viewModel: viewModel)
}

#Preview("error") {
    let viewModel = PopulationFromNationByYearViewModel(
        viewState: .error(message: "Error Message")
    )
    return PopulationFromNationByYearView(viewModel: viewModel)
}


