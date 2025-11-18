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
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
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
                
                //Using while statements and to keep track of the current message and image being shown:
                // generate a random messageNumber to use as an index
                // if messageNumber == lastMessageNumber {
                //     keep generating a new random messageNumber
                //     until we get a messageNumber != lastMessageNumber
                // set messageString to messages[messageNumber]
                // update the lastMessageNumber with messageNumber
                
//                var messageNumber = Int.random(in: 0...messages.count-1)
//                while messageNumber == lastMessageNumber{
//                    messageNumber = Int.random(in: 0...messages.count-1)
//                }
//                message = messages[messageNumber]
//                lastMessageNumber = messageNumber
//
//                var imageNumber = Int.random(in: 0...9)
//                while imageNumber == lastImageNumber{
//                    imageNumber = Int.random(in: 0...9)
//                }
//                imageName = "image\(imageNumber)"
//                lastImageNumber = imageNumber
                
                // Using repeat statement:
                
                var messageNumber: Int
                repeat{
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber: Int
                repeat{
                    imageNumber = Int.random(in: 0...9)
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
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
