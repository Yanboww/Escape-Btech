//
//  DraggableView.swift
//  Escape_Btech
//
//  Created by Student on 6/3/25.
//

import SwiftUI

struct DraggableView: View {
    @State var image: Image
    @State var type: Int
    var imageDimensions: CGSize
    var geometry: GeometryProxy
    @State var frameDimension: CGPoint
    @State var position: CGPoint = CGPoint(x: Int.random(in: 100..<800), y: 100)
    @State var rotTimer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    @ObservedObject var trashGameModel: TrashGameModel
    var body: some View {
        image.resizable().frame(width: frameDimension.x,height: frameDimension.y).position(position)
        .gesture(
            DragGesture()
                .onChanged{dragLocation in
                    position = centerPosition(position: dragLocation.location)
                }
                .onEnded{dropLocation in
                    trashGameModel.CheckDropped(draggedView: self, geometry: geometry)
                }
        ).onReceive(rotTimer){_ in
            trashGameModel.subtractScore(x: 10)
            resetPosition()
        }
    }
    
    func centerPosition(position: CGPoint) -> CGPoint{
        let centeredX = position.x + frameDimension.x/4
        let centeredY = position.y + frameDimension.y/4
        return CGPoint(x:centeredX,y: centeredY)
    }
    func resetPosition(){
        position = CGPoint(x: Int.random(in: 100..<800), y: 100)
        let imageRand = Int.random(in: 0..<10)
        switch imageRand {
        case 0:
            image = Image("MILK CARTON")
            type = 2
            frameDimension = CGPoint(x:438/4,y:578/4)
        case 1:
            image = Image("PIZZA")
            type = 0
            frameDimension = CGPoint(x:760/4,y:499/4)
        case 2:
            image = Image("SPOON")
            type = 2
            frameDimension = CGPoint(x:438/4,y:578/4)
        case 3:
            image = Image("KETCHUP")
            type = 2
            frameDimension = CGPoint(x:260/2,y:261/2)
        case 4:
            image = Image("APPLE")
            type = 0
            frameDimension = CGPoint(x:382/4,y:415/4)
        case 5:
            image = Image("CANDY")
            type = 1
            frameDimension = CGPoint(x:382/4,y:826/4)
        case 6:
            image = Image("CHICKEN TENDERS")
            type = 0
            frameDimension = CGPoint(x:354/3,y:377/3)
        case 7:
            image = Image("CHIPS")
            type = 1
            frameDimension = CGPoint(x:451/4,y:599/4)
        case 8:
            image = Image("POTATO WEDGES")
            type = 0
            frameDimension = CGPoint(x:700/4,y:599/4)
        case 9:
            image = Image("BANANA")
            type = 0
            frameDimension = CGPoint(x:685/4,y:602/4)
        default:
            print("ERROR: ImageRand out of bounds")
        }
        resetTimer()
    }
    
    func resetTimer(){
        rotTimer.upstream.connect().cancel()
        
        rotTimer = Timer.publish(every: 15, on: .main, in: .common).autoconnect()
    }
}


