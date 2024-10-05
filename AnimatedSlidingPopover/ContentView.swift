//
//  ContentView.swift
//  AnimatedSlidingPopover
//
//  Created by 陳信彰 on 2024/10/4.
//

import SwiftUI

struct ContentView: View {
    @State private var xOffset: CGFloat = -360
    @State private var displayPopup = false
    @State private var imageName = "chevron.forward.circle"
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            Button(action: {
                displayPopup.toggle()
                if displayPopup {
                    imageName = "multiply.circle.fill"
                    xOffset = 5
                } else {
                    imageName = "chevron.forward.circle"
                    xOffset = -360
                }
            })
            {
                Image(systemName: "chevron.forward.circle")
                    .font(.system(size: 35))
                    .foregroundStyle(.white)
            }
            .offset(x: -175, y: 300)
            
            HStack {
                Text("Click here to try another similar recipe. It is also gluten free...")
                    .font(.system(size: 16, weight: nil, design: .serif))
                    .foregroundStyle(.white)
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(Circle())
            }
            .frame(width: 300, height: 100)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
            .offset(x: xOffset, y: 300)
            .animation(.easeInOut(duration: 0.5), value: xOffset)
        }
    }
}

#Preview {
    ContentView()
}
