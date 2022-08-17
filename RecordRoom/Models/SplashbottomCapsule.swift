//
//  SplashbottomCapsule.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI

struct SplashbottomCapsule: View {
    //MARK: Properties
    @State private var animateGradient = false
    var height: CGFloat
    var body: some View {
        HStack{

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(LinearGradient(colors: [Color("CustomRed"), Color("CustomBlue")], startPoint: animateGradient ? .topTrailing : .leading, endPoint: animateGradient ? .leading : .bottomTrailing))
                        .frame(width: 10, height: height)
                        .offset(y: -20 / 2)
                        .clipped()
                        .offset(y: 40 / 4)
                        .frame(width: 40 / 2)
                        .frame(height: 70)
                        .padding(.trailing,-10)
                        .rotationEffect(.degrees(180))
                .onAppear {
                    withAnimation(.linear(duration: 0.5).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            
         
 

                        
                
        }
    }
}
    


struct SplashbottomCapsule_Previews: PreviewProvider {
    static var previews: some View {
        SplashbottomCapsule(height: 70)
    }
}
