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
    @Binding var level : Int
    let backgrounds: [ImageResource] = [.orchestraFULL, .revisedCafeteriaFULL, .sixthfloorFULL, .libraryFULL]
    
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
                        ZStack {
                            Rectangle()
                                .ignoresSafeArea()
                                .foregroundStyle(.white)
                                .frame(width: 800, height: 100)
                                .opacity(0.5)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .offset(x: -450)
                            Text("Escape Brooklyn Tech")
                                .font(Font.custom("pixel", size: 75))
                                .foregroundStyle(.black)
                                .padding()
                                .offset(x: -450)
                        }
                    }
                    Button{
                        if level < 1 {
                            level = 1
                        }
                    } label: {
                        Image("Button")
                            .resizable()
                            .frame(width: 300,height: 100)
                        Text("Play")
                            .foregroundStyle(.white)
                            .font(Font.custom("Pixel", size: 50))
                            .offset(x:-geometry.size.width*0.27,y:0)
                        
                    }
                    .offset(x:-geometry.size.width*0.50,y:geometry.size.height*0.15)
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
    struct Preview: View {
        @State var val = 0
        var body: some  View {
            MainMenuView(level: $val)
        }
    }
    return Preview()
}
