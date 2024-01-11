//
//  LoginViewModel.swift
//  AirBnB-Clone
//
//  Created by Djordje Arandjelovic on 11.1.24..
//

import FirebaseAuth

class LoginViewModel: ObservableObject {
    //MARK: - published properties that the view can bind to
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    
    //MARK: - login attempt func
//    func logIn() {
//        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//            DispatchQueue.main.async {
//                if (authResult?.user) != nil {
//                    self?.isLoggedIn = true
//                    // Handle successful login
//                } else if let error = error {
//                    self?.isLoggedIn = false
//                    // Handle login error
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
    func logIn(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            DispatchQueue.main.async {
                if authResult?.user != nil {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        }
    }
}


