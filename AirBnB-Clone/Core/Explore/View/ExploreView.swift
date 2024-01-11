//
//  ExploreView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 9.1.24..
//

import SwiftUI
import FirebaseAuth

struct ExploreView: View {
    
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    @State private var userEmail: String? = nil
    
    
    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView{
                    SearchBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    Text(userEmail ?? "Not logged in yet.")
                    
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listings) {listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
        .onAppear {
            Auth.auth().addStateDidChangeListener{_, user in
                self.userEmail = user?.email
            }
        }
    }
}

#Preview {
    ExploreView()
}
