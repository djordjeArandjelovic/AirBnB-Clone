//
//  Listing.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    //MARK: - listing
    let id: String
    //MARK: - owner
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    //MARK: - accomodation
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    let pricePerNight: Int
    let title: String
    let rating: Double
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
    var imageURLs: [String]
    //MARK: - location
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckIn
    case superHost
    
    var imageName: String {
        switch self {
        case .selfCheckIn: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }
    
    var title: String {
        switch self {
        case .selfCheckIn: return "Self check-in"
        case .superHost: return "Superhost"
        }
    }
    
    var subtitle: String {
        switch self {
        case .selfCheckIn:
            return "Check yourslef in with the keypad."
        case .superHost:
            return "Superhosts are experienced, highly rated hosts who are commited to proving great stars for guests"
        }
    }
    
    var id: Int {return self.rawValue}
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laudry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .kitchen: return "Kitchen"
        case .wifi: return "Wifi"
        case .laudry: return "Laundry"
        case .tv: return "TV"
        case .alarmSystem: return "Alarm System"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .kitchen: return "fork.knife"
        case .wifi: return "wifi"
        case .laudry: return "washer"
        case .tv: return "tv"
        case .alarmSystem: return "checkerboard.shield"
        case .office: return "pencil.and.ruler.fill"
        case .balcony: return "building"
        }
    }
    
    var id: Int {return self.rawValue}
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    
    case apartment
    case house
    case townHouse
    case villa
    
    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town Home"
        case .villa: return "Villa"
        }
    }
    
    var id: Int { return self.rawValue }
}
