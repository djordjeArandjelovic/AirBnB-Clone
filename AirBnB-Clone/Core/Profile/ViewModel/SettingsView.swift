//
//  SettingsView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 12.1.24..
//

import SwiftUI
import FirebaseAuth

enum selectedSetting {
    case delete
    case logout
    case none
}

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var userViewModel = UserLogViewModel()
    
    @State private var selectedOption: selectedSetting = .none
    @State private var showAlert: Bool = false
    @State private var accountDeleted: Bool = false
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingChangePassword = false
    
    let user = Auth.auth().currentUser
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: - Dark mode switch
                Section(header: Text("General")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                }
                
               
                
                //MARK: - Language
                
               
                if userViewModel.isUserLoggedIn {
                    //MARK: - Change password
                    
                    Section(header: Text("Security")) {
                        Button("Change Password") {
                            showingChangePassword = true
                        }
                    }
                    
                    //MARK: - Delete account
                    Section(header: Text("Danger zone")) {
                        Button{
                            selectedOption = .delete
                            showAlert = true
                        } label: {
                            Text("Delete Account")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    withAnimation {
                                        selectedOption = selectedOption == .delete ? .none : .delete
                                    }
                                }
                        }
                    }
                } else {
                    Text("Please log in to have access to all settings...")
                }
                
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingChangePassword) {
                Form {
                    SecureField("Current Password", text: $currentPassword)
                    SecureField("New Password", text: $newPassword)
                    SecureField("Confirm New Password", text: $confirmPassword)
                    Button("Update Password") {
                        // Validate and change password
                        //                        changePassword()
                    }
                    Divider()
                    Button("Cancel") {
                        showingChangePassword = false
                    }
                }
                
                
            }
            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button{
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Image(systemName: "xmark")
//                            .foregroundStyle(.black)
//                            .imageScale(.small)
//                    }
//                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Toggle(isOn: $isDarkMode) {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .foregroundStyle( isDarkMode ? .white : .black)
                            .padding()
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert (
                title: Text("Delete Acount"),
                message: Text("Are you sure you want to delte your account?"),
                primaryButton: .destructive(Text("DELETE")) {
                    //MARK: - DELETE LOGIC
                    user?.delete { error in
                        if let error = error {
                            print(error as Any)
                        } else {
                            accountDeleted = true
                        }
                    }
                },
                secondaryButton: .cancel {
                    selectedOption = .none
                }
            )
        }
        .alert("Account successfully deleted!", isPresented: $accountDeleted) {
            Button("Dismiss", role: .cancel) {
                selectedOption = .none
            }
        }
        //MARK: - App version
        Text("version 0.1")
            .font(.caption)
            .foregroundStyle(.gray)
    }
}

#Preview {
    SettingsView()
}

struct Collapsed: View {
    
    let title:String
    let desc:String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(desc)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}

struct CollapseMod: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}
