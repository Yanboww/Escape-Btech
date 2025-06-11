//
//  MainMenuView.swift
//  Escape_Btech
//
//  Created by Student on 6/9/25.
//

import SwiftUI

struct MainMenuView: View {
    @State var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State var index = 0
    @State var opacity = 1
    @State var backgroundX: CGFloat = 0
    
    let backgrounds: [ImageResource] = [.revisedCafeteriaFULL, .orchestraFULL]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(backgrounds[index])
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: -backgroundX)
                    .onAppear {
                        withAnimation(.linear(duration: 5)) {
                            backgroundX = geometry.size.width
                        }
                    }
                    .onChange(of: index) {
                        backgroundX = 0
                        withAnimation(.linear(duration: 5)) {
                            backgroundX = geometry.size.width
                        }
                    }
                VStack {
                    HStack {
                        Text("Escape Brooklyn Tech")
                            .font(Font.custom("pixel", size: 75))
                            .foregroundStyle(.black)
                            .padding()
                            .offset(x: -450)
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .onReceive(timer) {_ in
            withAnimation {
                if index == backgrounds.count - 1{
                    index = 0
                } else {
                    index += 1
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
