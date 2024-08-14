//  Created by Harold José on 13/08/2024.

import Foundation
import AJHttpClient
import XCTest
@testable import DataLayer

final class DataUsaRemoteDataSourceIntegrationTests: XCTestCase {

    private var dataSource: DataUsaRemoteDataSource!
    private var httpClient: AJHttpClientType!

    override func setUp() async throws {
        try await super.setUp()
        httpClient = AJHttpClient()
        dataSource = DataUsaRemoteDataSource(httpClient: httpClient)
    }

    override func tearDown() async throws {
        dataSource = nil
        httpClient = nil
        try await super.tearDown()
    }

    /// GIVEN DataUsaRemoteDataSource
    /// WHEN getPopulationByState is called
    /// THEN should return GetPopulationByStateResponse
    func test_getPopulationByState() async throws {
        // arrange
        let expectedIdState = "04000US01"
        // act
        let response = try? await dataSource.getPopulationByState(year: nil)

        // assert
        guard let response else {
            XCTFail("response is nil")
            return
        }
        XCTAssertTrue(response.data.count > 0)
        let state = response.data.first(where: {$0.idState == expectedIdState})
        XCTAssertNotNil(state)
    }

    /// GIVEN DataUsaRemoteDataSource
    /// WHEN getPopulationByState is called
    /// THEN should return GetPopulationByStateResponse
    func test_getPopulationByState_2020() async throws {
        // arrange
        let expectedIdState = "04000US01"
        let expectedYear = 2020
        // act
        let response = try? await dataSource.getPopulationByState(year: expectedYear)

        // assert
        guard let response else {
            XCTFail("response is nil")
            return
        }
        XCTAssertTrue(response.data.count > 0)
        guard let state = response.data.first(where: {$0.idState == expectedIdState}) else {
            XCTFail("state is nil")
            return
        }
        XCTAssertEqual(state.idYear, expectedYear)
    }

    /// GIVEN DataUsaRemoteDataSource
    /// WHEN getPopulationFromNationByYear is called
    /// THEN return GetPopulationByYearResponse
    func test_getPopulationFromNationByYear() async throws {
        // arrange
        let expectedIdNation = "01000US"
        // act
        let response = try? await dataSource.getPopulationFromNationByYear()

        // assert
        guard let response else {
            XCTFail("response is nil")
            return
        }
        XCTAssertTrue(response.data.count > 0)
        let state = response.data.first(where: {$0.idNation == expectedIdNation})
        XCTAssertNotNil(state)
    }
}
