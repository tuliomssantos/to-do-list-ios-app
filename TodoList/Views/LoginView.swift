//
//  LoginView.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    // @State var email = ""
    // @State var password = ""
    
    var body: some View {
        NavigationView{
            VStack {
                HeaderView(title: "ToDo List", subtitle: "Get things done", angle: 15, background: .pink)
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TodoListButtonView(title: "Login in", background: .blue){
                        viewModel.login()
                    }.padding(.top, 8)
                }
                .padding()
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }.padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
