//
//  SettingsScreenView.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI

struct SettingsScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") var isDarkMode: Bool = true
    var body: some View {
        ZStack{
            Color("CustomDark")
                .ignoresSafeArea()
            GeometryReader{metrics in
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
                    
                    
                    
                    HStack{
                        Spacer()
                        
                    Text("R")
                            .font(.custom("ZenTokyoZoo-Regular", size: metrics.size.width/8))
                    .foregroundColor(Color("DarkLightMode"))
                    Text("ecord")
                    .font(.custom("Monserrat-Regular", size:metrics.size.width/9))
                    .foregroundColor(Color("DarkLightMode"))
                    .padding(.leading,-6)
                    Text("R")
                    .font(.custom("ZenTokyoZoo-Regular", size: metrics.size.width/8))
                    .foregroundColor(Color("DarkLightMode"))
                    Text("oom")
                    .font(.custom("Monserrat-Regular",  size: metrics.size.width/9))
                    .foregroundColor(Color("DarkLightMode"))
                    .padding(.leading,-6)
                        Circle()
                            .frame(width: metrics.size.width/29, height: metrics.size.width/29, alignment: .bottom)
                            .foregroundColor(Color("CustomRed"))
                            .padding(.top,metrics.size.width/20)
                        
                        Spacer()
                        
                    }//logo hstack
                    
                    Text("About Record Room")
                        .font(.custom("BebasNeue", size: metrics.size.width/15))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom,-15)
                        .padding(.top,20)
                    
                    Text("Record Room lets you enjoy and explore new music. Listen to your favourite music ")
                        .font(.custom("Montserrat-Regular", size: metrics.size.width/25))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.top,-15)
                    
                    Text("Themes")
                        .font(.custom("BebasNeue", size: metrics.size.width/15))
                        .foregroundColor(Color("DarkLightMode"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .padding(.bottom,-15)
                        .padding(.top,10)
                    
                    HStack{
                        
                        
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color(isDarkMode ? "CustomRed" : "CustomDark"))
                                    .frame(width: 110, height: 157)
                                Image("ThemeOne")
                            }//zstack
                            Text("Dark Mode")
                                .font(.custom("Montserrat-Regular", size: metrics.size.width/25))
                                .foregroundColor(Color("DarkLightMode"))
                        }//vstack
                        .onTapGesture{
                            isDarkMode = true
                        }
                        VStack{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15, style: .continuous)
                                    .fill(Color(isDarkMode ? "CustomDark" : "CustomRed"))
                                    .frame(width: 110, height: 157)
                                Image("ThemeTwo")
                            }//zstack
                            Text("Light Mode")
                                .font(.custom("Montserrat-Regular", size: metrics.size.width/25))
                                .foregroundColor(Color("DarkLightMode"))
                                
                        }//vstack
                        .onTapGesture{
                            isDarkMode = false
                        }

                        
                    }//hstack
                    Spacer()
                    
                    Text("Developed by Pieter Venter")
                        .font(.custom("BebasNeue", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                    Text("Version 1.0")
                        .font(.custom("BebasNeue", size: metrics.size.width/20))
                        .foregroundColor(Color("DarkLightMode"))
                        
                    
                    
                }//vstack
            }//geo reader
            
        }//zstack
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            //use default device settings unless we change it here
            if(colorScheme == .dark){
                self.isDarkMode = true
            }else{
                self.isDarkMode = false
            }
        })

    }
}

struct SettingsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenView()
    }
}
