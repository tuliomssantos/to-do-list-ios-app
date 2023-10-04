//
//  ProfileViewViewModel.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

// problema com o meu usuario
// usar tuliomssantos2@gmai.com
// password tt9852

class ProfileViewViewModel: ObservableObject {
    init(){}
    
    @Published var user: User? = nil
    
    
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        print("userId: \(userId)")
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            print("data.id: \(String(describing: data["id"]))")
            
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
