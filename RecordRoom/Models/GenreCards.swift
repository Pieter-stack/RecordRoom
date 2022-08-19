//
//  GenreCrads.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/13.
//

import SwiftUI

struct GenreCards: View {
    var image: String
    var genre: String

    
    var body: some View {
       
            VStack{
            ZStack{
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color("CustomGray"))
                .frame(width: 100, height: 100)
                
                Image(image)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(15)
                    
            
            }//zstack
                Text(genre)
                    .foregroundColor(Color("DarkLightMode"))
                    .font(.custom("Montserrat-Regular", size: 20))
                
                
            }//vstack
            .padding([.leading,.top,.bottom])
        
        
    }
}

struct GenreCrads_Previews: PreviewProvider {
    static var previews: some View {
        GenreCards(image: "RecordPlate", genre: "Pop")
           
    }
}
