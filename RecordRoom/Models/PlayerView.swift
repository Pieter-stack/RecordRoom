//
//  PlayerView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/14.
//
import SwiftUI
import Firebase
import AVFoundation


struct PlayerView: View {
    @State var album: Album
    @State var song: Song
    @State var player = AVPlayer()
    @State var seekPos = 0.0
    @State var isPlaying: Bool = false
    @State var progress: CGFloat = 0.0
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isDarkMode") var isDarkMode: Bool = true

    
    
    var body: some View {
        GeometryReader{metrics in
            ZStack{
                Color("CustomDark")
                    .ignoresSafeArea()
            }
            
            VStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(Color(isDarkMode ? .white : .black))
                        .font(.system(size: 35, weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                Text(song.name)
                    .font(.custom("BebasNeue", size: metrics.size.width/5))
                    .foregroundColor(Color("DarkLightMode"))
                    .frame(maxWidth:.infinity, alignment: .center)
                Text(album.name)
                    .font(.custom("BebasNeue", size: metrics.size.width/20))
                    .foregroundColor(Color("DarkLightMode"))
                    .frame(maxWidth:.infinity, alignment: .center)
                    .padding(.top,-60)
                
                ZStack{

                    ZStack{
                    Image("Record")
                        .resizable()
                        .frame(width: metrics.size.width*1.6, height: metrics.size.width*1.6)
                        .clipped().frame(width: metrics.size.width, height: metrics.size.width - 110)
                        Image(album.image)
                            .resizable()
                            .frame(width: metrics.size.width/3, height: metrics.size.width/3)
                            .cornerRadius(metrics.size.width*1.6)
                            
                    }//zstack
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(Color("CustomGray"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: metrics.size.width, height: metrics.size.width - 110)
                    
                    Circle()
                        .trim(from: 0.0, to: progress / 2)
                        .stroke(Color("CustomRed"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: metrics.size.width, height: metrics.size.width - 110)
                        .rotationEffect(.degrees(270))
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 1, z: 0))
                    
                        
                }
                .padding(.bottom,50)
                .padding(.top,-40)
               
                Text("")
                    .font(.custom("BebasNeue", size: metrics.size.width/17))
                    .foregroundColor(Color("DarkLightMode"))
                    .opacity(0.7)
                    .frame(maxWidth:.infinity, alignment: .center)
                    .padding(.top,-50)
                
                HStack{
                    
                    Button(action: self.previous, label: {
                        Image(systemName: "backward.fill")
                            .font(.system(size: metrics.size.width/10, weight: .bold))
                            .foregroundColor(Color("CustomBlue"))
                    })
                    
                    
                    Button(action: self.playPause, label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill" )
                            .font(.system(size: metrics.size.width/10, weight: .bold))
                            .foregroundColor(Color(isPlaying ? "CustomRed" : "CustomBlue" ))
                    })
                    
                    Button(action: self.next, label: {
                        Image(systemName: "forward.fill")
                            .font(.system(size: metrics.size.width/10, weight: .bold))
                            .foregroundColor(Color("CustomBlue"))
                    })
                    
                    
                }//hstack
                
                
                
            }//vstack
           

        }//georeader
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(){
            self.playSong()
        }
    }
    
    func playSong(){
        let storage = Storage.storage().reference(forURL: self.song.file)
        storage.downloadURL{(url,error)in
            if error != nil{
                print(error)
            }else{
                
                do{
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
                }catch{
                    //error
                }
                
                
              player = AVPlayer(playerItem: AVPlayerItem(url: url!))
                player.play()
                
            }
            
        }
    }

    
    func playPause() {
        self.isPlaying.toggle()
        if isPlaying == true{
            player.pause()
            _ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                       withAnimation() {
                           self.progress += 0.001
                           if self.progress >= 1.0 {
                               timer.invalidate()
                           }
                       }
                   }
        
        }else{
            player.play()
        }
    }
    
    func next() {
        if let currentIndex = album.songs.firstIndex(of: song){
            if currentIndex == album.songs.count - 1{

            }
            else{
                player.pause()
                 song = album.songs[currentIndex + 1]
                self.playSong()
            }

       }
        
    }
    
    func previous() {
        if let currentIndex = album.songs.firstIndex(of: song){
            if currentIndex == 0{

            }else{
                player.pause()
                song = album.songs[currentIndex - 1]
                self.playSong()
            }

        }
    }
    
}
