//
//  gameHome.swift
//  Cosmos
//
//  Created by 😏 😏 on 22/10/2022.
//

import SwiftUI
import AVFoundation

var soundPlayer: AVAudioPlayer?

func playAudio(forResource: String, ofType: String) {
    
    let path = Bundle.main.path(forResource: forResource, ofType: ofType)!
    let url = URL(fileURLWithPath: path)
    
    do {
        soundPlayer = try AVAudioPlayer(contentsOf: url)
        soundPlayer?.play()
    } catch {
        print("Fail to play sound.")
    }
}


struct gameHome: View {
    @State var bgcolor = "game1l"
    @State var buttoncolor = "game1d"
    @State var bubblecon = 0
    @State var colorcon = 0
    @State var bubblename : [[String]] = [["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"],
                                          ["bubble1","bubble1","bubble1","bubble1","bubble1"]]
            
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color(bgcolor))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Button(action: {restart()}) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50, height: 40)
                            .foregroundColor(Color(buttoncolor))
                    }
                }
                Spacer()
                ForEach(0..<9){ i in
                    HStack{
                        ForEach(0..<5){ j in
                            bubbleView(imageName: bubblename[i][j])
                                .onTapGesture {
                                    if(bubblename[i][j] == "bubble1"){
                                        playAudio(forResource: "bubble", ofType: "wav")
                                        bubblename[i][j] = "bubble1b"
                                    }
                                    else if(bubblename[i][j] == "bubble2"){
                                        playAudio(forResource: "bubble", ofType: "wav")
                                        bubblename[i][j] = "bubble2b"
                                    }
                                    else if(bubblename[i][j] == "bubble3"){
                                        playAudio(forResource: "bubble", ofType: "wav")
                                        bubblename[i][j] = "bubble3b"
                                    }
                                    else if(bubblename[i][j] == "bubble4"){
                                        playAudio(forResource: "bubble", ofType: "wav")
                                        bubblename[i][j] = "bubble4b"
                                    }
                                }
                        }
                    }
                }
                Spacer()
            }
        }
        
    }
    func restart()-> Bool {
        bubblecon += 1
        colorcon += 1
        var bubble = 0
        var color = 0
        //bubble = bubblecon % 4
        bubble = Int.random(in: 0..<4)
        //color = colorcon % 4
        color = Int.random(in: 0..<4)
        for i in 0...8{
            for j in 0...4{
                if(bubble == 0){
                    bubblename[i][j] = "bubble1"
                }
                else if(bubble == 1){
                    bubblename[i][j] = "bubble2"
                }
                else if(bubble == 2){
                    bubblename[i][j] = "bubble3"
                }
                else if(bubble == 3){
                    bubblename[i][j] = "bubble4"
                }
            }
        }
        if(color == 0){
            bgcolor = "game1l"
            buttoncolor = "game1d"
        }
        else if(color == 1){
            bgcolor = "game2l"
            buttoncolor = "game2d"
        }
        else if(color == 2){
            bgcolor = "game3l"
            buttoncolor = "game3d"
        }
        else if(color == 3){
            bgcolor = "game4l"
            buttoncolor = "game4d"
        }
        
        playAudio(forResource: "change", ofType: "wav")
        
        return true
    }
}

struct gameHome_Previews: PreviewProvider {
    static var previews: some View {
        gameHome()
    }
}
