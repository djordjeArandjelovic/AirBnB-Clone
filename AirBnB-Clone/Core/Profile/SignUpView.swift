//
//  SignUpView.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 11.1.24..
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var passwordMatch: Bool = false
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Username", text: $username)
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
                SecureField("Confirm Password", text: $confirmPassword)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 44)
                        .foregroundColor(.pink)
                    
                    Button(action: {
                        //MARK: - signup action
                    }) {
                        Text("Sign up")
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
    SignUpView()
}
