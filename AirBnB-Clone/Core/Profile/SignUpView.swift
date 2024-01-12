//
//  SignUpView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 11.1.24..
//

import SwiftUI
import FirebaseAuth
import Firebase
import GoogleSignIn

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var userViewModel: UserLogViewModel
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    //    @State private var confirmPassword: String = ""
    @State private var passwordMatch: Bool = false
    @State private var showSuccessMessage = false
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    } else {
                        SecureField("Password", text: $password)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                    }
                }
                //                HStack {
                //                    if isPasswordVisible {
                //                        TextField("Confirm Password", text: $confirmPassword)
                //                            .autocapitalization(.none)
                //                            .disableAutocorrection(true)
                //                    } else {
                //                        SecureField("Confirm Password", text: $confirmPassword)
                //                            .autocapitalization(.none)
                //                            .disableAutocorrection(true)
                //                    }
                //
                //                    Button {
                //                        isPasswordVisible.toggle()
                //                    } label: {
                //                        Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                //                            .foregroundColor(.gray)
                //                    }
                //                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 44)
                        .foregroundColor(.pink)
                    
                    Button(action: {
                        //MARK: - signup action
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if (authResult?.user) != nil {
                                showSuccessMessage = true
                                userViewModel.updateLoginStatus()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            } else if let error = error {
                                // Handle sign up error
                                print(error.localizedDescription)
                            }
                        }
                    }) {
                        Text(showSuccessMessage ? "Account created successfully!" : "Sign up")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 44)
                        .foregroundColor(.blue)
                    
                    Button(action: {
                        //MARK: - google signup action
                    }) {
                        Text(showSuccessMessage ? "Account created successfully!" : "Or sign up with GOOGLE")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Sign up").font(.headline)
                }
            }
        }
    }
}

#Preview {
    SignUpView(userViewModel: UserLogViewModel())
}
