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
    @State private var soundIsOn = true
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
        
            HStack {
                Text("Sound On:")
                Toggle("Sound On", isOn: $soundIsOn)
                    .labelsHidden()
                    .onChange(of: soundIsOn){
                        if audioPlayer != nil && audioPlayer.isPlaying{
                                audioPlayer.stop()
                        }
                        
                    }
                
                Spacer()
                
                Button("Show Message") {
                    
                    let messages = ["You Are Awesome!",
                                    "When the Genius Bar Needs Help, They Call You!",
                                    "You Are Great",
                                    "Fabulous? That's You!",
                                    "You Are Fantstic!",
                                    "You Swifty!",
                                    "You Are a Code Monster!",
                                    "You Make Me Smile!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBounds: messages.count-1)
                    message = messages[lastMessageNumber]

                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBounds: numberOfImages-1)
                    imageName = "image\(lastImageNumber)"

                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBounds: numberOfImages-1)
                    if soundIsOn{
                        playSound(soundName: "sound\(lastSoundNumber)")
                    }
                }
                .buttonStyle(.borderedProminent)
            .font(.title2)
            }
            .tint(.accentColor)
            
        }
        .padding()
        
    }
    //Generates non-repeating random values
    //Accepts lastNumber, which represents lastMessageNumber, lastImageNumber, lastSoundNumber
    //Accepts upperBounds, which represents maximum of random-generated number
    func nonRepeatingRandom(lastNumber: Int, upperBounds: Int) -> Int{
        var randomNumber = 0
        repeat{
            randomNumber = Int.random(in: 0...(upperBounds))
        } while randomNumber == lastNumber
        //lastNumber = randomNumber
        return randomNumber  //Returns random Int value between 0 and upperBounds
    }
    
    func playSound(soundName: String){
        if audioPlayer != nil && audioPlayer.isPlaying{
                audioPlayer.stop()
        }
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
}

#Preview("Light Mode") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ContentView()
        .preferredColorScheme(.dark)
}
