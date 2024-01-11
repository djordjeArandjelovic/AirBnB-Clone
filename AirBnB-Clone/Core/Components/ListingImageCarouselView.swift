//
//  ListingImageCarouselView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 9.1.24..
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing
    
    var body: some View {
        TabView{
            ForEach(listing.imageURLs, id: \.self) {image in
                Image(image)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}


#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listing[0])
}
