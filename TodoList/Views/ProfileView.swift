//
//  ProfileView.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 124, height: 124)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:")
                                .bold()
                            Text(user.name)
                        }.padding()
                        
                        HStack {
                            Text("Email:")
                                .bold()
                            Text(user.email)
                        }.padding()
                        
                        HStack {
                            Text("Member since:")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
                    }
                    
                    Button("Logout") {
                        viewModel.logout()
                    }
                    .tint(Color.secondary)
                    
                    Spacer()
                } else {
                    ProgressView()
                }
            }.navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
