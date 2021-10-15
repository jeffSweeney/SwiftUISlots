//
//  ContentView.swift
//  MySlots
//
//  Created by Jeffrey Sweeney on 10/3/21.
//

import SwiftUI

struct ContentView: View {
    
    // Credits properties
    @State private var credits = 1000
    private var creditsColor: Color {
        if credits > 1000 {
            return Color.green
        } else if credits < 1000 {
            return Color.red
        } else {
            return Color.white
        }
    }
    
    // Slot image properties
    private let slotImages = ["apple", "cherry", "star"]
    @State private var leftSlot = "apple"
    @State private var middleSlot = "cherry"
    @State private var rightSlot = "star"
    
    var body: some View {
        ZStack {
            Image("SlotsBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("SwiftUI Slots!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.pink)
                
                Spacer()
                
                HStack {
                    Text("Credits:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text(String(credits))
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(creditsColor)
                }
                
                Spacer()
                
                HStack {
                    Image(leftSlot)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(middleSlot)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Image(rightSlot)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.horizontal, 50)
                
                Spacer()
                
                Button(action: spin, label: {
                    Text("Spin")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .padding(.horizontal, 40.0)
                        .foregroundColor(Color.white)
                        .background(Color.pink)
                        .cornerRadius(25)
                })
                
                Spacer()
            }
        }
    }
    
    private func spin() {
        let leftImage = Int.random(in: 0...2)
        let middleImage = Int.random(in: 0...2)
        let rightImage = Int.random(in: 0...2)
        
        leftSlot = slotImages[leftImage]
        middleSlot = slotImages[middleImage]
        rightSlot = slotImages[rightImage]
        
        if leftImage == middleImage && leftImage == rightImage {
            credits += 50
        } else {
            credits -= 5
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
