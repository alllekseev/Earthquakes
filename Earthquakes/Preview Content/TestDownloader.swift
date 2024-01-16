//
//  TestDownloader.swift
//  Earthquakes-iOS
//
//  Created by Олег Алексеев on 15.01.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(nanoseconds: UInt64.random(in: 100_000_000...500_000_000))
        return testQuakesData
    }
}
