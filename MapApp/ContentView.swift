//
//  ContentView.swift
//  MapApp
//
//  Created by francis on 17/06/2025.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}

#Preview {
    ContentView()
}
