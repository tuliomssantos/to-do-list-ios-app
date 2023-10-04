//
//  ToDoListItemViewViewModel.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ToDoListItemViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    init(){}
    
    func toggleIsDone(item: TodoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
}
