//
//  FavouriteCards.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/13.
//

import SwiftUI

struct FavouriteCards: View {
    var album : Album
    var body: some View {
        VStack{
        ZStack{
        RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(Color("CustomGray"))
            .frame(width: 100, height: 100)
            
            Image(album.image)
                .resizable()
                .frame(width: 100, height: 100)
                
        
        }//zstack
            Text(album.name)
                .foregroundColor(Color("DarkLightMode"))
                .font(.custom("Montserrat-Regular", size: 20))
            
            
        }//vstack
        .padding([.leading,.top,.bottom])
    
    
}
}


