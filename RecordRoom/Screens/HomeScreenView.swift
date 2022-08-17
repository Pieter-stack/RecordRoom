//
//  HomeScreenView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI
import Firebase


struct Album: Hashable {
    var id = UUID()
    var albumid: String
    var name: String
    var image: String
    var genre: String
    var fav: Bool
    var songs: [Song]
    
    
}
struct Song : Hashable {
    var id = UUID()
    var name: String
    var time: String
    var genre: String
}

struct HomeScreenView: View {
    @ObservedObject var data: OurData
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @State var searchText = ""
    @State var offset: CGFloat = 0
    @State var lastOffset: CGFloat = 0
    @GestureState var gestureOffset: CGFloat = 0
    @State private var currentAlbum : Album?
    @State private var currentSong : Song?
    @State var albumId = ""
    
    @State private var genreSearch: String? = "All"

    
    var body: some View {
        NavigationView{
        ZStack{
            Color("CustomDark")
                .ignoresSafeArea()
            GeometryReader{metrics in
                VStack{
                    HStack{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                   .fill(Color("CustomGray"))
                                   .frame(width: metrics.size.width/1.2, height: 50)
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color("DarkLightMode"))
                                    .padding(.leading)
                                TextField("", text: $searchText)
                                    .foregroundColor(.white)
                                
                                
                                    ZStack{
                                    RoundedRectangle(cornerRadius: 7, style: .continuous)
                                           .fill(Color("CustomRed"))
                                           .frame(width: metrics.size.width/3.8, height: 35)
                                        Text("Search")
                                            .font(.title2)
                                            .foregroundColor(.white)
                                    }//zstack
                                    .padding(.trailing,5)
                                    .onTapGesture{
                                        genreSearch = "Search"
                                    }
                                
                                
                            }//hstack
                        }//zstack
                        .frame(width: metrics.size.width/1.3, height: 50)
                        .padding(.leading,25)
                        .padding(.top)
                        Spacer()
                        NavigationLink(destination: SettingsScreenView()){
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("DarkLightMode"))
                            .padding()
                            .padding(.top)
                        }
                    }//hstack
                    
                    
                    Text("Genre")
                        .font(.custom("Montserrat-Regular", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                    ScrollView(.horizontal){
                        HStack{
                            GenreCards(image: "RecordPlate", genre: "Pop")
                                .onTapGesture{
                                genreSearch = "Pop"
                                }
                            GenreCards(image: "RecordPlate", genre: "Rock")
                                .onTapGesture{
                                genreSearch = "Rock"
                                }
                            GenreCards(image: "RecordPlate", genre: "Country")
                                .onTapGesture{
                                genreSearch = "Country"
                                }
                            GenreCards(image: "RecordPlate", genre: "HipHop")
                                .onTapGesture{
                                genreSearch = "HipHop"
                                }
                            GenreCards(image: "RecordPlate", genre: "Electronic")
                                .onTapGesture{
                                genreSearch = "Electronic"
                                }
                            
                        }//hstack
                    }//scrollview genre
                    .padding(.top,-20)

                    
                  
                    
                    
                    Text("Favourites")
                        .font(.custom("Montserrat-Regular", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.top,-20)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(self.data.albums, id: \.self, content:{ album in
                                if(album.fav == true){
                                FavouriteCards(album: album).onTapGesture {
                                    self.currentAlbum = album
                                    self.currentSong = album.songs[0]
                                    
                                }
                                }
                                    
                           })
                            
                        }//hstack
                    }//scrollview fav
                    .padding(.top,-20)
                    
                    Text("Library")
                        .font(.custom("Montserrat-Regular", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.top,-20)
                    
                    
                    
                    
                    ScrollView{
                        VStack{
                            
                            
                            
                            ForEach(self.data.albums, id: \.self, content:{ album in
                                
                                    
                                    
                                    if(genreSearch == "All")
                                    {
                                        VStack{
                                        AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                        self.albumId = album.albumid
                                        self.currentAlbum = album
                                        self.currentSong = album.songs[0]
                                        }
                                        }//vstack
                                        .padding(.bottom,150)
                                    } else if genreSearch == "Pop"{
                                        if album.genre == "Pop"{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                        
                                    }else if genreSearch == "Rock"{
                                        if album.genre == "Rock"{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                    }else if genreSearch == "Country"{
                                        if album.genre == "Country"{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                    }else if genreSearch == "HipHop"{
                                        if album.genre == "HipHop"{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                    }else if genreSearch == "Electronic"{
                                        if album.genre == "Electronic"{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                    }else if genreSearch == "Search"{
                                        if album.name == searchText{
                                            VStack{
                                            AlbumLibrary(album: album, albumId: self.$albumId).onTapGesture {
                                            self.albumId = album.albumid
                                            self.currentAlbum = album
                                            self.currentSong = album.songs[0]
                                                
                                            }//album
                                            }//vstack
                                        }//if album
                                    }
                                    
                                    
                                
                                
                           })
                           
                        }//vstack
                        
                        
                        
                    }//scrollview lib
                    

                }//vstack
                
                //Bottom sheet
                
                //for getting height for drag gesture
                GeometryReader{proxy -> AnyView in
                    
                    let height = proxy.frame(in: .global).height
                    
                    return AnyView(
                        ZStack{
                            BlurView(style: .systemThinMaterial)
                            .clipShape(CustomCorner(corners: [.topLeft,.topRight], radius: 30))
                            
                            VStack{
                                Capsule()
                                    .fill(.white)
                                    .frame(width: 120, height: 8)
                                    .padding(.top)
                                
                                if self.data.albums.first == nil {
                                    EmptyView()
                                }else{
                                PlayerView(album: self.currentAlbum ?? self.data.albums.first!, song: self.currentSong ?? Song(name: "Test", time: "Test", genre: "Test"))
                                }
                            
                                ScrollView{
                                    if self.data.albums.first == nil {
                                        EmptyView()
                                    }else{
                                        ForEach((self.currentAlbum?.songs ?? self.data.albums.first?.songs) ?? [Song(name: "Song 1", time: "2:13", genre: "Pop")], id:\.self, content:{song in
                                        
                                       
                                        
                                            SongCell(song:song, album: self.currentAlbum ?? self.data.albums.first!)
                                            .onTapGesture {
                                                self.currentSong = song
                                            }
                                            .padding(.bottom,60)
                                        
                                    })
                                    .padding(.trailing)
                                    //.padding(.bottom,100)
                                    }
   
                                }//scrollview
                                .frame(width: .infinity, height: 230, alignment: .bottom)
                               
                               
                                
                                
                            }////vstack
                            .frame(maxHeight: .infinity, alignment: .top)
                        }//zstack
                            .offset(y: height - 60)
                            .offset(y: -offset > 0 ? -offset <= (height - 120) ? offset : -(height - 120) : 0)
                            .gesture(DragGesture().updating($gestureOffset, body: {
                                value, out, _ in
                                
                                out = value.translation.height
                                onChange()
                            }).onEnded({value in
                                let maxHeight = height - 120
                                withAnimation{
                                    
                                    //logic for moving states
                                    //up down or mid
                                    
                                    if -offset > 100 && -offset < maxHeight / 2{
                                        //mid
                                        offset = -(maxHeight / 2)
                                    }
                                    else if -offset > maxHeight / 2 {
                                        offset = -maxHeight
                                        
                                    }else{
                                        offset = 0
                                    }
                                }
                                
                                //storing last offset value
                                lastOffset = offset
                                
                            }))
                    )//anyview
                }//geo reader
                .ignoresSafeArea(.all, edges: .bottom)
                
           
                
                
                
                
                
            }//geo reader
        }//zstack
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }//navigation view
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
    
    func onChange(){
        DispatchQueue.main.async {
            self.offset =  gestureOffset + lastOffset
        }
    }
    
    
    
    
}

struct AlbumLibrary: View{
    var album : Album
    @Binding var albumId : String
    var body: some View{
        GeometryReader{metrics in
        ZStack{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(LinearGradient(colors: [Color("CustomBlue"), Color("CustomRed")], startPoint: .leading, endPoint: .trailing))
                .opacity(0.8)
                .frame(width: metrics.size.width - 10, height: 130)
                .padding(.leading,5)
            
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CustomGray"))
                .frame(width: metrics.size.width - 20, height: 120)
                .padding(.leading,5)
            
            HStack{
                ZStack{
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .fill(Color("CustomGray"))
                    .frame(width: metrics.size.width/3, height: 150)
                    .padding(.leading,5)
                    Image(album.image)
                        .resizable()
                        .frame(width: metrics.size.width/3, height: 150,alignment: .center)
                        .aspectRatio(contentMode: .fill)
                }
                .clipped().cornerRadius(15)

                VStack{
                    Text(album.songs[0].name)
                    .font(.custom("BebasNeue", size: metrics.size.width/10))
                    .foregroundColor(Color("DarkLightMode"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top,-15)
                    .padding(.bottom,-10)
                    Text(album.name)
                        .font(.custom("BebasNeue", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,-10)
                        .padding(.bottom,-5)
                       
                    Text("\(album.songs.count) Songs")
                        .font(.custom("Monserrat-Regular", size: metrics.size.width/40))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack{
                    ScrollView(.horizontal){
                        HStack{
                            ZStack{
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                   .fill(Color("CustomGray2"))
                                   .frame(width: .infinity, height: 20)
                                Text(album.genre)
                                    .font(.custom("Monserrat-Regular", size: metrics.size.width/40))
                                    .padding([.leading,.trailing])
                                    .foregroundColor(.white)
                            }//zstack
                        }//hstack
                    }//scrollview
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .frame(height: 20)
                    
                        
                        Image(systemName: (album.fav ? "heart.fill" : "heart"))
                            .resizable()
                            .frame(width: 15, height: 15)
                            .foregroundColor(Color((album.fav ? "CustomRed" : "CustomBlue")))
                            .padding(.trailing,50)
                            .onTapGesture{
                            
                                if(album.fav == true){
                                    let db = Firestore.firestore()
                                    db.collection("albums").document(self.albumId).setData([
                                        "fav": false
                                    ], merge: true){err in
                                        if let err = err{
                                            print(err)
                                        }else{
                                            print("Success")
                                        }
                                        
                                    }
                                }else{
                                   
                                    let db = Firestore.firestore()
                                    db.collection("albums").document(self.albumId).setData([
                                        "fav": true
                                    ], merge: true){err in
                                        if let err = err{
                                            print(err)
                                        }else{
                                            print("Success")
                                        }
                                        
                                    }
                            }
                    }//hstack
                }//vstack
            }//hstack
            

            
            
        }//zstack
           
    }//geo reader
        
       
    }
    

    }
    
}


struct SongCell: View{
    var song : Song
    var album : Album
    var body: some View{
     
            
        
        GeometryReader{metrics in
            
            
        ZStack{
            

        
            Rectangle()
                .foregroundColor(Color("CustomRed"))
                .frame(width: metrics.size.width - 20, height: 70)
                .padding(.trailing, 35)
                .cornerRadius(35)
                .padding(.trailing, -35)
                .padding(.leading, 5)
                .cornerRadius(5)
                .padding(.leading, -5)
                .mask(
                    Rectangle()
                        .overlay(
                            Rectangle()
                                .foregroundColor(Color("CustomBlue"))
                                .frame(width: metrics.size.width - 20, height: 70)
                                .padding(.trailing, 35)
                                .cornerRadius(35)
                                .padding(.trailing, -35)
                                .padding(.leading, 5)
                                .cornerRadius(5)
                                .padding(.leading, -5)
                                .padding(.bottom,7)
                                .blendMode(.destinationOut)                                )
                    
              
                )
            
            HStack{
                ZStack{
                Image("RecordPlate")
                    .resizable()
                    .frame(width: 60, height: 60)
                    
                    Image("RecordPlate")
                        .resizable()
                        .frame(width: 22, height: 22)
                }//zstack
                .padding(.leading,10)
                VStack{
                    Text(song.name)
                        .font(.custom("BebasNeue", size: metrics.size.width/20))
                        .padding([.leading,.trailing])
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(album.name)
                        .font(.custom("BebasNeue", size: metrics.size.width/30))
                        .padding([.leading,.trailing])
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
                HStack{
                Text(song.time)
                    .font(.custom("BebasNeue", size: metrics.size.width/20))
                    .padding([.leading,.trailing])
                    .foregroundColor(Color("DarkLightMode"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                }
                
            }//hstack

            
            
        }//zstack
        .padding(.leading,10)
            


            
        }//geo reader
    
    }
}


struct CurrentSong: View{
    var song : Song
    var album : Album
    var body: some View{
     
            
        
        GeometryReader{metrics in
            
            
        ZStack{
            
            Rectangle()
                .foregroundColor(Color("CustomBlue"))
                .frame(width: metrics.size.width - 20, height: 70)
                .padding(.trailing, 35)
                .cornerRadius(35)
                .padding(.trailing, -35)
                .padding(.leading, 5)
                .cornerRadius(5)
                .padding(.leading, -5)
                .opacity(0.7)
        
            Rectangle()
                .foregroundColor(Color("CustomRed"))
                .frame(width: metrics.size.width - 20, height: 70)
                .padding(.trailing, 35)
                .cornerRadius(35)
                .padding(.trailing, -35)
                .padding(.leading, 5)
                .cornerRadius(5)
                .padding(.leading, -5)
                .mask(
                    Rectangle()
                        .overlay(
                            Rectangle()
                                .foregroundColor(Color("CustomBlue"))
                                .frame(width: metrics.size.width - 20, height: 70)
                                .padding(.trailing, 35)
                                .cornerRadius(35)
                                .padding(.trailing, -35)
                                .padding(.leading, 5)
                                .cornerRadius(5)
                                .padding(.leading, -5)
                                .padding(.bottom,7)
                                .blendMode(.destinationOut)                                )
                    
              
                )
            
            HStack{
                ZStack{
                Image("RecordPlate")
                    .resizable()
                    .frame(width: 60, height: 60)
                    
                    Image("RecordPlate")
                        .resizable()
                        .frame(width: 22, height: 22)
                }//zstack
                .padding(.leading,10)
                VStack{
                    Text(song.name)
                        .font(.custom("BebasNeue", size: metrics.size.width/20))
                        .padding([.leading,.trailing])
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(song.time)
                        .font(.custom("BebasNeue", size: metrics.size.width/30))
                        .padding([.leading,.trailing])
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top,-20)
                }
                
                HStack{
                    Image(systemName: "backward.fill")
                        .resizable()
                        .frame(width: 29, height: 19)
                        .foregroundColor(Color("CustomBlue"))
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 19, height: 19)
                        .foregroundColor(Color("CustomBlue"))
                    Image(systemName: "forward.fill")
                        .resizable()
                        .frame(width: 29, height: 19)
                        .foregroundColor(Color("CustomBlue"))
                }
                .padding(.trailing, 29)
                
                
            }//hstack

            
            
        }//zstack
        .padding(.leading,10)
            


            
        }//geo reader
    
    }
}



struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView(data: OurData())
    }
}


