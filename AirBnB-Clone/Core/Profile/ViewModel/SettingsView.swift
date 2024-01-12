//
//  SettingsView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 12.1.24..
//

import SwiftUI

enum selectedSetting {
    case delete
    case logout
    case none
}

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedOption: selectedSetting = .none
    @State private var showAlert: Bool = false
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showingChangePassword = false
    
    var body: some View {
        NavigationView {
            Form {
                //MARK: - Dark mode switch
                Section(header: Text("General")) {
                    Toggle(isOn: $isDarkMode) {
                        Text("Dark Mode")
                    }
                }
                
                //MARK: - Change password
                
                Section(header: Text("Security")) {
                    Button("Change Password") {
                        showingChangePassword = true
                    }
                }
                
                //MARK: - Language
                
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
            }
            .navigationTitle("Settings")
            .navigationBarItems(leading: Button("Back") {
                presentationMode.wrappedValue.dismiss()
            }.foregroundStyle(.black))
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
                ToolbarItem(placement: .navigationBarTrailing) {
                    Toggle(isOn: $isDarkMode) {
                        Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                            .foregroundStyle( isDarkMode ? .white : .black)
                    }
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert (
                title: Text("Delete Acount"),
                message: Text("Are you sure you want to delte your account?"),
                primaryButton: .destructive(Text("DELETE")) {
                    print("Account deletion")
                },
                secondaryButton: .cancel {
                    selectedOption = .none
                }
            )
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
