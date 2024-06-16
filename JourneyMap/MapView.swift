//
//  MapView.swift
//  JourneyMap
//
//  Created by aicccux on 6/16/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Map() {
                    
                }
                NavigationLink(destination: { MarkerListView() }, label: { Image(systemName: "list.bullet.clipboard").font(.title).padding().background(.white).foregroundColor(.blue).clipShape(Circle()).shadow(radius: 4, x: 0, y: 4).padding() })
            }
        }
    }
}

#Preview {
    MapView()
}
