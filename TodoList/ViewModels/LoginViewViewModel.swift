//
//  LoginViewViewModel.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func login(){
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                    if error != nil {
                        print(error?.localizedDescription ?? "")
                    } else {
                        print("success")
                    }
        }
        
        print("LoginViewModel")
    }
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains("@") else {
            errorMessage = "Invalid email"
            
            return false
        }
        
        return true
    }
    
    init(){
        
    }
}
