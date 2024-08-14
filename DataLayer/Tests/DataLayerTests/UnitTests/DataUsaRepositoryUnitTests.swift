//  Created by Harold José on 13/08/2024.

import Foundation
import AJHttpClient
import XCTest
@testable import DataLayer

final class DataUsaRepositoryUnitTests: XCTestCase {

    private var repository: DataUsaRepository!
    private var remoteDataSource: DataUsaRemoteDataSourceSpy!

    override func setUp() async throws {
        try await super.setUp()
        remoteDataSource = DataUsaRemoteDataSourceSpy()
        repository = DataUsaRepository(remoteDataSource: remoteDataSource)
    }

    /// GIVEN DataUsaRepository
    /// WHEN GetPopulationFromNationByYear is called
    /// THEN should call remoteDataSource
    func test_GetPopulationFromNationByYear() async throws {

        // arrange
        let expectedResponse = GetPopulationByYearResponse.fixture()
        remoteDataSource.getPopulationFromNationByYearReturn = expectedResponse

        // act
        let result = try await repository.getPopulationFromNationByYear()

        // assert
        XCTAssertTrue(remoteDataSource.getPopulationFromNationByYearCalled)
        XCTAssertEqual(result, expectedResponse.data.toDTO())
    }

    func test_GetPopulationByState() async throws {

        // arrange
        let expectedYear = 2024
        let expectedResponse = GetPopulationByStateResponse.fixture()
        remoteDataSource.getPopulationByStateReturn = expectedResponse

        // act
        let result = try await repository.getPopulationByState(year: expectedYear)

        // assert
        XCTAssertTrue(remoteDataSource.getPopulationByStateCalled)
        XCTAssertEqual(result, expectedResponse.data.toDTO())
        XCTAssertEqual(remoteDataSource.getPopulationByStateReceivedYear, expectedYear)
    }

}
