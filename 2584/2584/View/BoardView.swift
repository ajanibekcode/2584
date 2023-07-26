//
//  BoardView.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import SwiftUI

struct BoardView: View{
    @Binding var board: [[Int]]    
    var body: some View{
        VStack(spacing: 8){
            ForEach(0..<board.count, id: \.self){ row in
                HStack(spacing: 8){
                    ForEach(0..<board[row].count, id: \.self){ column in
                        CellView(number: board[row][column])
                    }
                }
            }
        }
        .padding()
        .background(Color.gray)
        .cornerRadius(8)
    }
}
