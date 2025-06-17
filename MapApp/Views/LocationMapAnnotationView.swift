//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing:0){
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 30,height: 30)
                .font(.headline)
                .padding(6)
                .foregroundColor(.white )
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10,height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y:-4)
                .padding(.bottom,40)
               
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
