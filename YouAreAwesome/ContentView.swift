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
                .multilineTextAlignment(.center)
            
            Spacer()
        
            Button("Show Me!") {
//                let message1 = "You are Awesome!"
//                let message2 = "You are Great!"
//                let message3 = "Fabulous? That's you!"

//                if message == message1{
//                    message = message2
//                } else if message == message2{
//                    message = message3
//                } else{
//                    message = message1
//                }
                
                let messages = ["You Are Awesome!",
                                "When the Genius Bar Needs Help, They Call You!",
                                "You Are Great",
                                "Fabulous? That's You!",
                                "You Are Fantstic!",
                                "You Swifty!",
                                "You Are a Code Monster!",
                                "You Make Me Smile!",
                                "Added a new one"]
                
                message = messages[messageNumber]
                messageNumber += 1
                if messageNumber > (messages.count - 1){
                    messageNumber = 0
                }
                
                imageName = "image\(imageNumber)"
                imageNumber += 1
                
                if imageNumber > 9{
                    imageNumber = 0
                }
                
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
