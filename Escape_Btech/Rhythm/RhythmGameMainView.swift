//
//  RhythmGameMainView.swift
//  Escape_Btech
//
//  Created by Student on 5/23/25.
//

import SwiftUI

struct RhythmGameMainView: View {
    @EnvironmentObject var model: RhythmGameModel
    @State var scoreList: [String] = [""]
    @StateObject var audioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        ZStack {
            model.displayScored(text: scoreList[scoreList.count - 1])
            
            ForEach($model.arrows) {$arrow in
                Image(arrow.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: ModelConstants.arrowDimensions)
                    .position(arrow.position)
                    .opacity(arrow.isEnabled ? 1 : 0)
            }
            
            ForEach($model.clickArrows) {$arrow in
                Image(arrow.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .grayscale(arrow.grayscale)
                    .opacity(arrow.opactity)
                    .frame(height: ModelConstants.arrowDimensions)
                    .position(arrow.position)
                    .onTapGesture {
                        model.arrowClicked(arrow: arrow)
                        arrow.grayscale = 0
                        arrow.opactity = 1
                        withAnimation(.linear(duration: 0.2)) {
                            arrow.grayscale = 1
                            arrow.opactity = 0.5
                        }
                    }
            }
            VStack {
                Text("Score: \(model.score)")
                    .foregroundStyle(.white)
                    .font(Font.custom("pixel", size: 20))
                    .padding()
                Spacer()
            }
            
            if model.gameOver {
                if model.isWon {
                    Text("You Win!")
                        .font(Font.custom("pixel", size: 75))
                        .foregroundStyle(.green)
                        .shadow(color: .black, radius: 1.5, x: 1, y: 1)
                        .onAppear {
                            audioPlayerViewModel.playOrPause()
                        }
                } else {
                    Text("You Lose...")
                        .font(Font.custom("pixel", size: 75))
                        .foregroundStyle(.red)
                        .shadow(color: .black, radius: 1.5, x: 1, y: 1)
                        .onAppear {
                            audioPlayerViewModel.playOrPause()
                        }
                }
            }
        }
        .frame(width: 400, height: 350)
        .background(Color(red: 0.2, green: 0.2, blue: 0.2, opacity: 0.8))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .onReceive(model.timer) {_ in
            withAnimation {
                model.moveArrows()
            }
            model.updateArrows()
            scoreList = model.scoreList
        }
        .onAppear {
            audioPlayerViewModel.playOrPause()
        }
    }
}

#Preview {
    RhythmGameMainView()
        .environmentObject(RhythmGameModel())
}
