//
//  BoardingScreen.swift
//  RecordRoom
//
//  Created by Pieter Venter on 2022/08/12.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var backgroundimage: String
    var title: String
    var description: String
}

var boardingScreens: [BoardingScreen] = [

BoardingScreen(image: "Headphones", backgroundimage: "BackgroundOne", title: "One", description: "One Omne"),
BoardingScreen(image: "Record", backgroundimage: "BackgroundTwo", title: "Two", description: "Two Two"),
BoardingScreen(image: "Search", backgroundimage: "BackgroundThree", title: "Three", description: "Three Three")




]


