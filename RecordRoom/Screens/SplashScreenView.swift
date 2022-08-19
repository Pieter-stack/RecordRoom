//
//  SplashScreenView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI
import Firebase

struct SplashScreenView: View {
    
    //Handle onboarding variable
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    @Environment(\.colorScheme) private var colorScheme
    let data = OurData()
    init(){
        if isOnboarding == false{
        FirebaseApp.configure()
        data.loadAlbums()
        }
    }
    
    @State var animate = false
    @State var isActive:Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.3
    var device = UIDevice.current.name

    
    
    var body: some View {
        GeometryReader{metrics in
            ZStack{
                Color(isDarkMode ? .black : .white)
                    .ignoresSafeArea()
                
                if self.isActive {
                    if isOnboarding == false{
                        HomeScreenView(data: data)
                    }else{
                        OnboardingScreenView()
                    }
                            } else {
                                
                            VStack{
                                HStack{
                                HStack{
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        .padding(.leading,8)
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    
                                }
                                    HStack{
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                    }
                                    HStack{
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashtopCapsule(height:CGFloat.random(in: 70..<150))
                                        
                                        
                                    }
                                }
                                .ignoresSafeArea()
                                .padding(.top,-60)

                                
                                Button{
                                    isOnboarding.toggle()
                                }label:{
                                    Text("Onboarding")
                                }
                                
                                
                                if device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini"{
                                    Spacer()
                                    HStack{
                                        Spacer()
                                    Text("RR")
                                        .foregroundColor(Color("DarkLightMode"))
                                        .font(.custom("ZenTokyoZoo-Regular", size: metrics.size.width/4))
                                        
                                        Circle()
                                            .frame(width: metrics.size.width/18, height: metrics.size.width/18, alignment: .bottom)
                                            .foregroundColor(Color("CustomRed"))
                                            .padding(.top,metrics.size.width/10)
                                        Spacer()
                                        Spacer()
                                       
                                    }
                                    .scaleEffect(size)
                                    .opacity(opacity)
                                    .onAppear{
                                        withAnimation(.easeIn(duration: 1.2)){
                                        self.size = 1
                                        self.opacity = 1
                                        }
                                    }
                                    Spacer()
                                    
                                }else{
                                    Spacer()
                                    HStack{
                                    Text("RR")
                                        .foregroundColor(Color("DarkLightMode"))
                                        .font(.custom("ZenTokyoZoo-Regular", size: metrics.size.width/4))
                                        
                                        Circle()
                                            .frame(width: metrics.size.width/18, height: metrics.size.width/18, alignment: .bottom)
                                            .foregroundColor(Color("CustomRed"))
                                            .padding(.top,metrics.size.width/10)
                                        
                                       
                                    }
                                    .scaleEffect(size)
                                    .opacity(opacity)
                                    .onAppear{
                                        withAnimation(.easeIn(duration: 1.2)){
                                        self.size = 1
                                        self.opacity = 1
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                HStack{
                                HStack{
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        .padding(.leading,8)
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    
                                }
                                    
                                    HStack{

                                        SplashbottomCapsule(height: animate ? 60 : CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    }
                                    HStack{
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                        SplashbottomCapsule(height:CGFloat.random(in: 70..<150))
                                    }
                                }
                                .padding(.bottom,-60)
                                .ignoresSafeArea()
                                
                            }
                            }
                            }
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.isActive = true
                            }
                        }
                    }
                        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
