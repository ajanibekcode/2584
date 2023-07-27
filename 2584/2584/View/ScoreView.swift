//
//  ScoreView.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import SwiftUI

struct ScoreView: View{
    let score: Int
    
    var body: some View{
        VStack{
            Text("Score:")
                .font(.headline)
            Text("\(score)")
                .font(.title)
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.scoreButton)
        .cornerRadius(8)
    }
}
