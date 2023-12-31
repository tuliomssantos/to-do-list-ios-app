//
//  HeaderView.swift
//  TodoList
//
//  Created by Tulio on 12/09/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    
    var body: some View {
        ZStack {
            // RoundedRectangle(cornerRadius: 0)
            //     .foregroundColor(background)
            //     .rotationEffect(Angle(degrees: angle))
                
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.black)
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.gray)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        //.offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
    }
}
