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

BoardingScreen(image: "Headphones", backgroundimage: "BackgroundOne", title: "Enjoy Your Music", description: "Enjoy quality audio, to make your listening experience better!"),
BoardingScreen(image: "Record", backgroundimage: "BackgroundTwo", title: "Put Your Records On", description: "With Record Room you can listen to your favourite artists songs and albums all in one place!"),
BoardingScreen(image: "Search", backgroundimage: "BackgroundThree", title: "Explore", description: "Searching for albums has never been quicker and easier with Record Room.")




]


