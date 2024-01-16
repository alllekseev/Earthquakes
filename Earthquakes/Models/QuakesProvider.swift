//
//  QuakesProvider.swift
//  Earthquakes-iOS
//
//  Created by Олег Алексеев on 15.01.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

@MainActor
class QuakesProvider: ObservableObject {

    @Published var quakes: [Quake] = []

    let client: QuakeClient

    init(client: QuakeClient = QuakeClient()) {
        self.client = client
    }

    func fetchQuakes() async throws {
        let latesQuakes = try await client.quakes
        self.quakes = latesQuakes
    }

    func deleteQuakes(atOffsets offsets: IndexSet) {
        quakes.remove(atOffsets: offsets)
    }
}
