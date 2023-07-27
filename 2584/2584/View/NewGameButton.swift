//
//  NewGameButton.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import SwiftUI

struct NewGameButton: View{
    let action: () -> Void
    
    var body: some View{
        Button("New Game", action: action)
            .foregroundColor(.white)
            .padding()
            .background(Color.button)
            .cornerRadius(8)
    }
}
