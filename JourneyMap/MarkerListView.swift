//
//  MarkerListView.swift
//  JourneyMap
//
//  Created by aicccux on 6/16/24.
//

import SwiftUI
import SwiftData

struct MarkerListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var markerItems: [MarkerItem]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(markerItems) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = MarkerItem(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(markerItems[index])
            }
        }
    }
}

#Preview {
    MarkerListView()
        .modelContainer(for: MarkerItem.self, inMemory: true)
}
