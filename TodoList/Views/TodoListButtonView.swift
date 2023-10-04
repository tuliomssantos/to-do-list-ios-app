//
//  TodoListButtonView.swift
//  TodoList
//
//  Created by Tulio on 14/09/23.
//

import SwiftUI

struct TodoListButtonView: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .bold()
                    .foregroundColor(Color.white)
                
            }
        }
    }
}

struct TodoListButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListButtonView(title: "Todo List Button", background: .blue) {
            // Action
            print("click")
        }
    }
}
