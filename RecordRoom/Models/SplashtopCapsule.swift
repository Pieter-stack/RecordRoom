//
//  SplashtopCapsule.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI

struct SplashtopCapsule: View {
    //MARK: Properties
    @State private var animateGradient = false
    var height: CGFloat
    var body: some View {
        HStack{

            RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(LinearGradient(colors: [Color("CustomBlue"), Color("CustomRed")], startPoint: animateGradient ? .leading : .bottomTrailing, endPoint: animateGradient ? .topTrailing : .leading))
                        .frame(width: 10, height: height)
                        .offset(y: -10 / 2)
                        .clipped()
                        .offset(y: 0)
                        .frame(width: 20 / 2)
                        .frame(height: 70)
                        
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                        animateGradient.toggle()
                    }
                }
            


                        
                
        }
    }
}

struct SplashtopCapsule_Previews: PreviewProvider {
    static var previews: some View {
        SplashtopCapsule(height: 70)
    }
}
