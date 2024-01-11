//
//  LoginViewModel.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 11.1.24..
//

import Combine

class LoginViewModel: ObservableObject {
    //MARK: - published properties that the view can bind to
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    
    //MARK: - login attempt func
    func login() {
        //MARK: - authentification logic
        if username == "user" && password == "password" {
            isLoggedIn = true
        } else {
            isLoggedIn = false
        }
    }
}


