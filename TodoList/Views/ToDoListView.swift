//
//  ToDoListView.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
// 2:23:47

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }.tint(.red)
                        }
                }.listStyle(PlainListStyle())
            }.navigationTitle("To Do List")
                .toolbar {
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "f3XwLYylQ5bQ0cn6zBBpg0u6OF03")
    }
}
