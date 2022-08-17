//
//  PlayerView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/14.
//
import SwiftUI


struct PlayerView: View {
   var album: Album
   var song: Song
   // @State var progress: CGFloat = 0.0
    @State var isPlaying: Bool = false
    var body: some View {
        GeometryReader{metrics in
            VStack{
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
                            
                    }//zstack
                    Circle()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(Color("CustomGray"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: metrics.size.width, height: metrics.size.width - 110)
                    
                    Circle()
                        .trim(from: 0.0, to: 0.3)
                        .stroke(Color("CustomRed"), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: metrics.size.width, height: metrics.size.width - 110)
                        .rotationEffect(.degrees(270))
                        .rotation3DEffect(.degrees(180), axis: (x: 1, y: 1, z: 0))
                    
                        
                }
                .padding(.bottom,50)
                .padding(.top,-40)
               
                Text("2:13")
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
            .padding(.top,20)
            
        }//georeader
    }
    
    
    func playPause() {
        self.isPlaying.toggle()
    }
    
    func next() {
        
    }
    
    func previous() {
        
    }
    
}
