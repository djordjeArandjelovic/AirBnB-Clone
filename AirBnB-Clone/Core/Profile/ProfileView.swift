//
//  ProfileView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 10.1.24..
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @StateObject private var viewModel = LoginViewModel()
    @State private var loginPressed: Bool = false
    @State private var isUserLoggedIn: Bool = Auth.auth().currentUser != nil
    @State private var isPasswordVisible: Bool = false
    @State private var showSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                
                //MARK: - Profile, Log in, Sign up
                VStack(alignment: .leading, spacing: 32) {
                    
                    //MARK: - Profle Title
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        VStack {
                            if let user = Auth.auth().currentUser {
                                Text("Logged in as \(user.email ?? "Unknown")")
                            } else {
                                Text("Log in to start planing your next trip")
                            }
                        }
                        .onAppear {
                            isUserLoggedIn = Auth.auth().currentUser != nil
                        }
                        
                    }
                    
                    if isUserLoggedIn {
                        //MARK: - Log out button
                        Button(action: {
                            do {
                                try Auth.auth().signOut()
                                isUserLoggedIn = false
                            } catch {
                                print("Error signing out")
                            }
                        }) {
                            Text("Log out")
                                .logoutButtonStyle()
                        }
                    } else {
                        //MARK: - Log in button
                        Button(action: {
                            if !loginPressed {
                                withAnimation(.snappy) {
                                    loginPressed.toggle()
                                }
                            } else {
                                viewModel.logIn() { success in
                                    if success {
                                        isUserLoggedIn = true
                                        withAnimation {
                                            loginPressed = false
                                        }
                                        viewModel.email = ""
                                        viewModel.password = ""
                                    }
                                }
                            }
                        }) {
                            Text("Log in")
                                .loginButtonStyle()
                        }
                    }
                    
                    
                    if loginPressed {
                        VStack {
                            HStack {
                                TextField("Username", text: $viewModel.email)
                                    .font(.subheadline)
                                    .keyboardType(.emailAddress)
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
                    NavigationLink(destination: SettingsView()) {
                        ProfileOptionRowView(imageName: "gear", title: "Settings")
                            .foregroundStyle(.black)
                    }
                    ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                    ProfileOptionRowView(imageName: "questionmark.circle", title: "Visit the Help Center")
                }
                .padding(.vertical)
            }
            .padding()
        }
    }
}


#Preview {
    ProfileView()
}

extension View {
    func loginButtonStyle() -> some View {
        self.foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 48)
            .background(Color.pink)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    func logoutButtonStyle() -> some View {
        self.foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 48)
            .background(Color.blue) // Change as per your design
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
