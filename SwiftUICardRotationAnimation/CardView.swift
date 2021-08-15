//
//  ContentView.swift
//  SwiftUICardRotationAnimation
//
//  Created by Radi Barq on 15/08/2021.
//

import SwiftUI

struct CardView: View {
    @State private var cardSide: CardSide = .front
    @State private var cardImageName = "yellow-flower"
    var body: some View {
        NavigationView {
            VStack {
                imageView
                    .frame(width: 300, height: 500, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
            }
            .rotation3DEffect(cardSide == .front ? .degrees(0): .degrees(-180), axis: (x: 1, y: 0, z: 0))
            .animation(.easeInOut(duration: 0.5))
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: {
                        cardSide.toggle()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            cardImageName = cardSide == .front ? "yellow-flower" : "dusty-rose-flower"
                        }
                    }, label: {
                        Text("Flip")
                    })
                }
            }
            .padding()
        }
    }
    
    var imageView: some View {
        Image(cardImageName)
            .resizable()
            .scaledToFill()
    }
    
    private enum CardSide {
        case front
        case back
        mutating func toggle() {
            self = self == .front ? .back : .front
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
