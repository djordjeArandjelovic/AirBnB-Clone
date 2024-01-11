//
//  ExploreService.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listing
    }
}
