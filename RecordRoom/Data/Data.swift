//
//  Data.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/14.
//

import Foundation
import SwiftUI
import Firebase

class OurData : ObservableObject{
  @Published public var albums = [Album]()
    
    
    func loadAlbums(){
        Firestore.firestore().collection("albums").getDocuments { (snapshot, error) in
            if error == nil{
                for document in snapshot!.documents{
                    let albumid = document.data()["albumid"] as? String ?? "error"
                    let name = document.data()["name"] as? String ?? "error"
                    let image = document.data()["image"] as? String ?? "error"
                    let genre = document.data()["genre"] as? String ?? "error"
                    let fav = document.data()["fav"] as? Bool ?? false
                    let songs = document.data()["songs"] as? [String : [String : Any]]
                    
                    
                    
                    
                    var songsArray = [Song]()
                    if let songs = songs{
                        for song in songs{
                            let songName = song.value["name"] as? String ?? "error"
                            let songTime = song.value["time"] as? String ?? "error"
                            let songGenre = song.value["genre"] as? String ?? "error"
                            let songFile = song.value["file"] as? String ?? "error"
                            songsArray.append(Song(name: songName, time: songTime, genre: songGenre, file: songFile))
                        }
                    }
                    self.albums.append(Album( albumid: albumid, name: name, image: image, genre: genre, fav: fav, songs: songsArray))
                }
            }else{
               // print(error)
            }
        }
    }
}
