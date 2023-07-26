//
//  ContentView.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var gameBoard = Board(size: 4)
    @GestureState private var dragState: CGSize = .zero
    @State private var accumulatedDragTranslation: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color.background
                .edgesIgnoringSafeArea(.all)
            VStack{
                ScoreView(score: gameBoard.score)
                BoardView(board: $gameBoard.board)
//                MARK: User Swipe
                    .gesture(
                        DragGesture()
                            .updating($dragState) {value, state, _ in
                                state = value.translation
                            }
                            .onEnded{value in
                                accumulatedDragTranslation.width += value.translation.width
                                accumulatedDragTranslation.height += value.translation.height
                                let moveDirection = getMoveDirection(from: accumulatedDragTranslation)
                                gameBoard.move(direction: moveDirection)
                                accumulatedDragTranslation = .zero
                            }
                    )
                NewGameButton(action: {
                    gameBoard = Board(size: 4)
                })
            }
        }
    }
    
//    MARK: Calculate Movement Direction
    
    private func getMoveDirection(from translation: CGSize) -> Direction{
        let gestureThreshold: CGFloat = 50
        
        if translation.width > gestureThreshold && abs(translation.width) > abs(translation.height){
            return .right
        } else if translation.width < -gestureThreshold && abs(translation.width) > abs(translation.height){
            return .left
        } else if translation.height > gestureThreshold && abs(translation.height) > abs(translation.width){
            return .down
        } else if translation.height < -gestureThreshold && abs(translation.height) > abs(translation.width){
            return .up
        }
        return .up
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
