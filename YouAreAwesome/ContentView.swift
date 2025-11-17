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
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    var body: some View {
        
        VStack {
            
            Text(message)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 100)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(radius: 30)
                //.animation(.bouncy(duration: 0.5, extraBounce: 0.2), value: imageName)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Spacer()
        
            Button("Show Me!") {
                
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great",
                                "Fabulous? That's You!",
                                "You Are Fantstic!",
                                "You Swifty!",
                                "You Are a Code Monster!",
                                "You Make Me Smile!"]
                
                message = messages[Int.random(in: 0...messages.count-1)]
                
                imageName = "image\(Int.random(in: 0...9))"
                
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
