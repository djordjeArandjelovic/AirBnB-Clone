//
//  UserLogViewModel.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 12.1.24..
//

import Foundation
import FirebaseAuth

class UserLogViewModel: ObservableObject {
    @Published var isUserLoggedIn: Bool = Auth.auth().currentUser != nil

    func updateLoginStatus() {
        isUserLoggedIn = Auth.auth().currentUser != nil
    }
}
