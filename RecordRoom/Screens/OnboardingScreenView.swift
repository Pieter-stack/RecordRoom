//
//  OnboardingScreenView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI
import Firebase

struct OnboardingScreenView: View {
    @State var offset: CGFloat = 0
    @State private var action: Int? = 0
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    let data = OurData()
    init(){
        if isOnboarding == false{
        FirebaseApp.configure()
        data.loadAlbums()
    }
    }
    
    
    
    var device = UIDevice.current.name
    var body: some View {
        NavigationView{

            ZStack{
                Color("CustomDark")
                    .ignoresSafeArea()
            
                OffsetPageTabView(offset: $offset){
                    ZStack{
                        Color("CustomDark")
                            .ignoresSafeArea()
                        
 
                    HStack{
                        
                        ForEach(boardingScreens){screen in
                            
                                
                           
                            VStack{
                                ZStack{
                                    ZStack{
                                    Image(screen.backgroundimage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: getScreenBounds().width  , height: getScreenBounds().width - 100)
                                        .padding(.top,-90)
                                    
                                    RoundedRectangle(cornerRadius: getScreenBounds().width - 40, style: .continuous)
                                        .fill(LinearGradient(colors: [Color("CustomDark").opacity(0.3), Color("CustomRed").opacity(0.6)], startPoint: .top, endPoint: .bottom))
                                        .frame(width: getScreenBounds().width - 70, height: getScreenBounds().width * 1.8  )
                                        .offset(y: -getScreenBounds().width / 1.5)
                                        .clipped()
                                    
                                    }
                                    .padding(.top,-120)
                                    VStack{
                                        HStack{
                                            
                                        Text("R")
                                        .font(.custom("ZenTokyoZoo-Regular", size: 30))
                                        .foregroundColor(Color("DarkLightMode"))
                                        Text("ecord")
                                        .font(.custom("Monserrat-Regular", size: 26))
                                        .foregroundColor(Color("DarkLightMode"))
                                        .padding(.leading,-6)
                                        Text("R")
                                        .font(.custom("ZenTokyoZoo-Regular", size: 30))
                                        .foregroundColor(Color("DarkLightMode"))
                                        Text("oom")
                                        .font(.custom("Monserrat-Regular", size: 26))
                                        .foregroundColor(Color("DarkLightMode"))
                                        .padding(.leading,-6)
                                            Circle()
                                                .frame(width: getScreenBounds().width/50, height: getScreenBounds().width/50, alignment: .bottom)
                                                .foregroundColor(Color("CustomRed"))
                                                .padding(.top,getScreenBounds().width/30)
                                            
                                        }//logo hstack
                                        .padding(.top,50)
                                        
                                        
                                        
                                        if device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini" || device == "iPhone 13 Pro"{
                                        
                                            Image(screen.image)
                                                    .frame(width: getScreenBounds().width + 8, height: getScreenBounds().width - 100)
                                                    
                                        }else{
                                            Image(screen.image)
                                                    .frame(width: getScreenBounds().width + 8, height: getScreenBounds().width - 100)
                                                    .padding(.top,90)
                                                    
                                        }
                                        
                                        if device == "iPod touch (7th generation)" || device == "iPhone SE (3rd generation)" || device == "iPhone 8" || device == "iPhone 8 Plus" || device == "iPhone 13 mini" || device == "iPhone 13 Pro" {
                                            
                                            VStack{
                                            Text(screen.title)
                                            .font(.custom("BebasNeue", size: getScreenBounds().width/9))
                                            .foregroundColor(Color("DarkLightMode"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding([.leading,.trailing],50)
                                            
                                            Text(screen.description)
                                            .font(.custom("Monserrat-Regular", size: getScreenBounds().width/20))
                                            .foregroundColor(Color("DarkLightMode"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding([.leading,.trailing],50)
                                            }
                                            
                                            
                                        }else{
                                            
                                            VStack{
                                            Text(screen.title)
                                            .font(.custom("BebasNeue", size: getScreenBounds().width/9))
                                            .foregroundColor(Color("DarkLightMode"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding([.leading,.trailing],50)
                                            
                                            Text(screen.description)
                                            .font(.custom("Monserrat-Regular", size: getScreenBounds().width/20))
                                            .foregroundColor(Color("DarkLightMode"))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding([.leading,.trailing],50)
                                            }
                                            .padding(.top,-30)
                                            
                                        }
                                        
                                       
                                        Spacer()
                                    }//vstack in z stack

                                    
                                    
                            }//zStack
                                Spacer()
                        
                            }//vstack
                            .frame(width: getScreenBounds().width - 8 )
                            .frame(maxHeight: .infinity)
                           
                        }//foreach
                    }//hstack
                }//zstack
                }//offsetpagetabview
            }//zstack
            .navigationBarHidden(true)
            .padding(.top,-90)
            .overlay(
                VStack{
                    HStack{
                        
                        if getIndex() == 0 {
                            Spacer()
                            Spacer()
                            Spacer()
                        }else{
                            ZStack{
                                RoundedRectangle(cornerRadius: getScreenBounds().width / 3, style: .continuous)
                                    .fill(LinearGradient(colors: [Color("CustomDark"), Color("CustomBlue")], startPoint: .leading, endPoint: .trailing))
                                            .frame(width: getScreenBounds().width / 3, height: 70)
                                            .offset(x: -getScreenBounds().width / 16)
                                            .clipped()
                                            .opacity(0.5)
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35, weight: .bold))
                                
                            }//zstack
                            .onTapGesture{
                                offset = min(offset - getScreenBounds().width,getScreenBounds().width * 2)
                            }
                        }
                        
                        

                        
                        
                        
                        
                        
                        Spacer()
                        
                        HStack{
                            ForEach(boardingScreens.indices, id: \.self){ index in
                                Capsule()
                                           .fill(index == (getIndex()) ? Color("CustomRed") : Color("CustomGray"))
                                           .frame(width: 10, height: index == (getIndex()) ? 60 : 30)
                                           .animation(.easeIn, value: getIndex())
                                
                            }
                        }
                        
                        
                        
                        Spacer()
                        
                        if getIndex() == 2 {
                            NavigationLink(destination: HomeScreenView(data: data), tag: 1, selection: $action) {
                                EmptyView()
                            }

                                    // NavigationLink(destination: HomeScreenView(data: data)){
                                        ZStack{
                                        RoundedRectangle(cornerRadius: getScreenBounds().width / 3, style: .continuous)
                                            .fill(LinearGradient(colors: [Color("CustomDark"), Color("CustomBlue")], startPoint: .leading, endPoint: .trailing))
                                                    .frame(width: getScreenBounds().width / 3, height: 70)
                                                    .offset(x: -getScreenBounds().width / 16)
                                                    .clipped()
                                                    .opacity(0.5)
                                                    .rotationEffect(.degrees(180))
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 35, weight: .bold))
                                        }//zstack
                                        .onTapGesture{
                                           isOnboarding.toggle() //die toggle breek die connection na db
                                            self.action = 1
                                        }//nav link
                                        
                                   //}

                             
                        }else{
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: getScreenBounds().width / 3, style: .continuous)
                                .fill(LinearGradient(colors: [Color("CustomDark"), Color("CustomBlue")], startPoint: .leading, endPoint: .trailing))
                                        .frame(width: getScreenBounds().width / 3, height: 70)
                                        .offset(x: -getScreenBounds().width / 16)
                                        .clipped()
                                        .opacity(0.5)
                                        .rotationEffect(.degrees(180))
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 35, weight: .bold))
                        }//zstack
                        .onTapGesture{
                            offset = min(offset + getScreenBounds().width,getScreenBounds().width * 2)
                        }
                        
                        
                        }
                        
                        
                    }//hstack
                }//Vstack
                ,alignment: .bottom
            
            )//overlay
        }//Nav view
        
        
        

        
        
        
    }
    
    //func
    
    //getIndex of pages
    func getIndex()->Int{
        let progress = (offset / getScreenBounds().width).rounded()
        
        return Int(progress)
    }
}




struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}

//Extending view to get screen bounds

extension View{
    func getScreenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
