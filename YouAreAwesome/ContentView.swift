//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jim Walejko on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    var body: some View {
        
        VStack {
            Spacer()
            //Image(systemName: "hand.thumbsup")
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            // .frame(width: 200, height: 200
            // )
            Text(message)
                .font(.largeTitle)
                .fontWeight(.ultraLight)
                .foregroundStyle(.black)
            Spacer()
        
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
                let imageString1 = "hand.thumbsup"
                let imageString2 = "sun.max.fill"
                
//                if message == message1{
//                    message = message2
//                    imageName = imageString2
//                }else{
//                    message = message1
//                    imageName = imageString1
//                }
    // Using Ternary Operator"
                imageName = (message == message1 ? imageString2 : imageString1)
                message = (message == message1 ? message2 : message1)
                
            }
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
            .tint(.orange)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
