//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jim Walejko on 11/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    //@State private var imageString = ""
    @State private var imageName = ""
    var body: some View {
        
        VStack {
            Spacer()
            
            //Image("image0")
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
            
            Spacer()
        
            Button("Press Me!") {
                let message1 = "You are Awesome!"
                let message2 = "You are Great!"
//                let imageString1 = "image0"
//                let imageString2 = "image1"
            
    // Using Ternary Operator"
               // imageName = (message == message1 ? imageString2 : imageString1)
                message = (message == message1 ? message2 : message1)
                imageName = (imageName == "image0" ? "image1" : "image0")
            }
            
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
