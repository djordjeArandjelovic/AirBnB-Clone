//
//  ProfileView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            //MARK: - Profile, Log in, Sign up
            VStack(alignment: .leading, spacing: 32) {
                
                //MARK: - Profle Title
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    Text("Log in to start planing your next trip")
                }
                
                //MARK: - Log in button
                Button {
                    
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                //MARK: - Sign up button
                
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign up")
                        .underline()
                        .fontWeight(.semibold)
                }
                .font(.caption)
            }
            
            //MARK: - Settings, Accessibility, Help
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
