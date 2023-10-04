//
//  RegisterView.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import SwiftUI

struct RegisterView: View {
//    @State var fullname = ""
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .blue)
                // .offset(y: -250)
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage).foregroundColor(Color.red)
            }
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                TodoListButtonView(title: "Create Account", background: .green){
                    viewModel.register()
                }
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View { 
        RegisterView()
    }
}
