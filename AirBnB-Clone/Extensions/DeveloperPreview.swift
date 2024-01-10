//
//  DeveloperPreview.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import Foundation

class DeveloperPreview {
    var listings: [Listing] = [
        .init(
            //MARK: - listing
            id: NSUUID().uuidString,
            //MARK: - owner
            ownerUid: NSUUID().uuidString,
            ownerName: "John Smith",
            ownerImageUrl: "male-avatar",
            //MARK: - accomodation
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laudry, .tv],
            type: .villa,
            imageURLs: ["miami-1-1", "miami-1-2", "miami-1-3", "miami-1-4"],
            //MARK: - location
            latitude: 25.7850,
            longitude: -80.1936,
            address: "124 Main St",
            city: "Miami",
            state: "Florida"
        ),
        .init(
            //MARK: - listing
            id: NSUUID().uuidString,
            //MARK: - owner
            ownerUid: NSUUID().uuidString,
            ownerName: "Mark Whalberg",
            ownerImageUrl: "male-avatar",
            //MARK: - accomodation
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 664,
            title: "Miami Beach House",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .tv, .kitchen, .office],
            type: .villa,
            imageURLs: ["miami-2-1", "miami-2-2", "miami-2-3", "miami-2-4"],
            //MARK: - location
            latitude: 25.7706,
            longitude: -80.1340,
            address: "78 Beach St",
            city: "Miami",
            state: "Florida"
        ),
        .init(
            //MARK: - listing
            id: NSUUID().uuidString,
            //MARK: - owner
            ownerUid: NSUUID().uuidString,
            ownerName: "Steve Johnson",
            ownerImageUrl: "male-avatar",
            //MARK: - accomodation
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            title: "Beautiful Miami apartment in downtown Brickell",
            rating: 4.32,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .villa,
            imageURLs: ["miami-3-1", "miami-3-2", "miami-3-3", "miami-3-4"],
            //MARK: - location
            latitude: 25.7650,
            longitude: -80.1936,
            address: "2376 Brickell Drive",
            city: "Miami",
            state: "Florida"
        ),
        .init(
            //MARK: - listing
            id: NSUUID().uuidString,
            //MARK: - owner
            ownerUid: NSUUID().uuidString,
            ownerName: "Harry Styles",
            ownerImageUrl: "male-avatar",
            //MARK: - accomodation
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            title: "Beautiful Los Angeles home in Malibu",
            rating: 4.97,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .villa,
            imageURLs: ["la-1-1", "la-1-2", "la-1-3", "la-1-4"],
            //MARK: - location
            latitude: 34.2,
            longitude: -118.0426,
            address: "5 Malibu Road",
            city: "Los Angeles",
            state: "California"
        ),
        .init(
            //MARK: - listing
            id: NSUUID().uuidString,
            //MARK: - owner
            ownerUid: NSUUID().uuidString,
            ownerName: "Chris Bumstead",
            ownerImageUrl: "male-avatar",
            //MARK: - accomodation
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 580,
            title: "Beautiful Los Angeles home in Hollywood Hills",
            rating: 4.99,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .villa,
            imageURLs: ["la-2-1", "la-2-2", "la-2-3", "la-2-4"],
            //MARK: - location
            latitude: 34.1,
            longitude: -118.1426,
            address: "44 Dude Hill",
            city: "Los Angeles",
            state: "California"
        ),
        
    ]
}
