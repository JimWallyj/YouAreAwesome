//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Jim Walejko on 11/4/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var lastMessageNumber = -1
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    let numberOfImages = 10 // images labeled image0 thru image9
    let numberOfSounds = 6  // sounds labeled sound0 thru sound5
    
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
                
                var messageNumber: Int
                repeat{
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while messageNumber == lastMessageNumber
                message = messages[messageNumber]
                lastMessageNumber = messageNumber
                
                var imageNumber: Int
                repeat{
                    imageNumber = Int.random(in: 0...(numberOfImages-1))
                } while imageNumber == lastImageNumber
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                var soundNumber: Int
                repeat{
                    soundNumber = Int.random(in: 0...(numberOfSounds-1))
                }while soundNumber == lastSoundNumber
                // Read the File from the Assets Catalog
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
                guard let soundFile = NSDataAsset(name: soundName) else{
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                // Initialize the AVAudioPlayer & Play Sound
                do{
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                }catch{
                    print("😡 ERROR: \(error.localizedDescription) creating audioPlayer")
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
