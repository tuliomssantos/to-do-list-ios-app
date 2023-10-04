//
//  RegisterViewViewModel.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
            
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
//                    if error != nil {
//                        print(error?.localizedDescription ?? "")
//                    } else {
//                        print("success")
//                    }
        }
        
        print("LoginViewModel")
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty, !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields"
            
            return false
        }
        
        guard email.contains("@") && email.contains("@") else {
            errorMessage = "Invalid email"
            
            return false
        }
        
        guard password.count >= 6 else {
            return false
        }
        
        return true
    }
    
    init(){
        
    }
}
