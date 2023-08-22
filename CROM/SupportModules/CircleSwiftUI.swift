//
//  CircleSwiftUI.swift
//  CROM
//
//  Created by Allan Hull on 6/18/23.
//


import SwiftUI

struct CircleSwiftUI: View {
    var imagePIC: String
    
    var body: some View {
             
        Image(imagePIC)
         .clipShape(Circle())
             .shadow(radius: 10) // 10
         .overlay(Circle()
             .stroke(Color.red, lineWidth: 5))
     //    .offset(x:0, y: -130)
    }
}
