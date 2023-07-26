//
//  CellView.swift
//  2584
//
//  Created by Aknazar Janibek on 7/23/23.
//

import SwiftUI

struct CellView: View{
    var number: Int
    
    var body: some View{
        Text(number == 0 ? "" : "\(number)")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 64, height: 64)
            .background(getCellColor())
            .cornerRadius(8)
    }
    
    private func getCellColor() -> Color{
        switch number {
        case 0: return Color.gray // Empty Cell
        case 1: return Color(red: 255/255, green: 204/255, blue: 153/255)
        case 2: return Color(red: 255/255, green: 153/255, blue: 102/255)
        case 3: return Color(red: 255/255, green: 102/255, blue: 102/255)
        case 5: return Color(red: 255/255, green: 51/255, blue: 51/255)
        case 8: return Color.red
        case 13: return Color(red: 255/255, green: 128/255, blue: 0)
        case 21: return Color(red: 255/255, green: 153/255, blue: 51/255)
        case 34: return Color(red: 255/255, green: 204/255, blue: 51/255)
        case 55: return Color.yellow
        case 89: return Color(red: 204/255, green: 255/255, blue: 102/255)
        case 144: return Color.green
        case 233: return Color(red: 153/255, green: 255/255, blue: 102/255)
        case 377: return Color(red: 102/255, green: 204/255, blue: 0)
        case 610: return Color(red: 51/255, green: 153/255, blue: 0)
        case 987: return Color(red: 0, green: 102/255, blue: 51/255)
        case 1597: return Color(red: 51/255, green: 204/255, blue: 204/255)
        case 2584: return Color.blue
        default:
            return Color.black
        }
    }
}
