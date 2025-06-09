//
//  TrashGameModel.swift
//  Escape_Btech
//
//  Created by Student on 5/22/25.
//

import Foundation
import SwiftUI


class TrashGameModel: ObservableObject{
    @Published private(set) var timers: [Timer.TimerPublisher] = [Timer.publish(every: 5, on: .main, in: .common)]
    @Published private(set) var timerMaxes: [Int] = [60,45,30]
    @Published private(set) var binLocations: [CGPoint] = [CGPoint(x:(407/3)*6,y:(397/6)),CGPoint(x:(407/3)*3.25,y:(397/6)),CGPoint(x:(407/3/2),y:(397/6))]
    @Published private(set) var score : Int = 0
    @Published private(set) var backgroundPosition = [310, 200]
    
    var move1 = false
    var move2 = false
    
    
    func CheckDropped(draggedView: DraggableView, geometry: GeometryProxy){
        let droppedPosition : CGPoint = draggedView.position
        
        let dropX = droppedPosition.x
        let dropY = droppedPosition.y
        let geoWidth = geometry.size.width
        let geoHeight = geometry.size.height
        
        let draggedRect = CGRect(x: dropX, y: dropY, width: draggedView.frameDimension.x, height: draggedView.frameDimension.y)
        
        let rect1 = CGRect(x:(geoWidth-binLocations[0].x),y:(geoHeight-binLocations[0].y),width:(407/3),height:(397/6))
        let rect2 = CGRect(x:(geoWidth-binLocations[1].x),y:(geoHeight-binLocations[1].y),width:(407/3),height:(397/6))
        let rect3 = CGRect(x:(geoWidth-binLocations[2].x),y:(geoHeight-binLocations[2].y),width:(407/3),height:(397/6))
        switch draggedView.type {
            case 0:
                CheckDroppedHelper(playerRect: draggedRect, thisRect: rect1, other1: rect2, other2: rect3, viewDragged: draggedView)
            case 1:
                CheckDroppedHelper(playerRect: draggedRect, thisRect: rect2, other1: rect1, other2: rect3, viewDragged: draggedView)
            case 2:
                CheckDroppedHelper(playerRect: draggedRect, thisRect: rect3, other1: rect1, other2: rect2, viewDragged: draggedView)
            default:
                //oobe
                print("Error: Type out of bounds")
        }
        
        
    }
    
    func CheckDroppedHelper(playerRect: CGRect, thisRect: CGRect, other1: CGRect, other2: CGRect, viewDragged: DraggableView ){
        if(playerRect.intersects(thisRect)){
            subtractScore(x: -10)
            viewDragged.resetPosition()
            viewDragged.resetTimer()
        }
        if(playerRect.intersects(other1)){
            subtractScore(x: 20)
            viewDragged.resetPosition()
            viewDragged.resetTimer()
        }
        if(playerRect.intersects(other2)){
            subtractScore(x: 20)
            viewDragged.resetPosition()
            viewDragged.resetTimer()
        }
        
    }
    
    func reset(){
        score = 0
        backgroundPosition = [310, 200]
    }
    
    func subtractScore(x: Int){
        score -= x
    }
    
    
}
