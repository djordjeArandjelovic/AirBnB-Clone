//
//  ProfileView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var loginPressed: Bool = false
    @State private var isPasswordVisible: Bool = false
    @State private var showSignUp: Bool = false
    
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
                    withAnimation(.snappy) {
                        loginPressed.toggle()
                    }
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                
                if loginPressed {
                    VStack {
                        HStack {
                            TextField("Username", text: $viewModel.username)
                                .font(.subheadline)
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("Password", text: $viewModel.password)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .font(.subheadline)
                            } else {
                                SecureField("Password", text: $viewModel.password)
                                    .autocapitalization(.none)
                                    .disableAutocorrection(true)
                                    .font(.subheadline)
                            }
                            
                            Button {
                                isPasswordVisible.toggle()
                            } label: {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(height: 44)
                        .padding(.horizontal)
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color(.systemGray4))
                        }
                    }
                    .frame(height: loginPressed ? 120 : 0)
                }
                
                //MARK: - Sign up button
                
                HStack {
                    Text("Don't have an account?")
                    
                    Button {
                        showSignUp = true
                    } label: {
                        Text("Sign up")
                            .underline()
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }
                    .sheet(isPresented: $showSignUp) {
                        SignUpView()
                    }
                    
                    
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
