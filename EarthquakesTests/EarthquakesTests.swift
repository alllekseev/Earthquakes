//
//  EarthquakesTests.swift
//  EarthquakesTests
//
//  Created by Олег Алексеев on 15.01.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import XCTest
@testable import Earthquakes

final class EarthquakesTests: XCTestCase {

    func testGeoJSONDecoderDecodesQuake() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let quake = try decoder.decode(Quake.self, from: testFeature_nc73649179)

        XCTAssertEqual(quake.code, "73649170")

        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = quake.time.timeIntervalSince1970

        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)

        let expectedTsunami = 0
        let decodedTsunami = quake.tsunami
        
        XCTAssertEqual(expectedTsunami, decodedTsunami)
    }

    func testGeoJSONDecoderDecodesGeoJSON() throws {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        let decoded = try decoder.decode(GeoJSON.self, from: testQuakesData)

        XCTAssertEqual(decoded.quakes.count, 6)
        XCTAssertEqual(decoded.quakes[0].code, "73649170")

        let expectedSeconds = TimeInterval(1636129710550) / 1000
        let decodedSeconds = decoded.quakes[0].time.timeIntervalSince1970
        XCTAssertEqual(expectedSeconds, decodedSeconds, accuracy: 0.00001)
    }

    func testQuakeDetailsDecoder() throws {
        let decoder = JSONDecoder()
        let decoded = try decoder.decode(QuakeLocation.self, from: testDetail_hv72783692)

        XCTAssertEqual(decoded.longitude, -155.434173583984)
    }

    func testClientDoesFetchEarthquakeData() async throws {
        let downloader = TestDownloader()
        let client = QuakeClient(downloader: downloader)
        let quakes = try await client.quakes

        XCTAssertEqual(quakes.count, 6)
    }
}
