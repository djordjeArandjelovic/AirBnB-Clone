//
//  WishlistView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import SwiftUI
import FirebaseAuth

struct WishlistView: View {
    
    @State private var isUserLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 4) {
                    if isUserLoggedIn {
                        Text("Your current withlist:")
                            .font(.headline)
                    } else {
                        Text("Log in to view your wishlists")
                            .font(.headline)
                        Text("You can create, view or edit wishlists once you log in")
                            .font(.footnote)
                    }
                    
                }
                
                Button {
                    
                } label: {
                    if !isUserLoggedIn {
                        Text("Log in")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 48)
                            .background(.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
        .onAppear{
            Auth.auth().addStateDidChangeListener { _, user in
                self.isUserLoggedIn = user != nil
            }
        }
    }
}

#Preview {
    WishlistView()
}
