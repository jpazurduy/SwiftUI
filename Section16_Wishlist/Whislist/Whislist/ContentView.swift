//
//  ContentView.swift
//  Whislist
//
//  Created by Jorge Azurduy on 1/26/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var wishes: [WishlistModel]
    @State private var isAlertShowing = false
    @State private var title = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text(wish.title)
                        .fontWeight(.light)
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("DElete", role: .destructive) {
                                modelContext.delete(wish)
                                
                            }
                        }
                }
            }// :List
        
            .navigationTitle("Wishes")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                if wishes.count > 0 {
                    ToolbarItem(placement: .bottomBar) {
                        Text(wishes.count.description)
                    }
                }
            }
            .alert("Create a new Wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                Button {
                    
                    modelContext.insert(WishlistModel(title: title))
                    title = ""
                    
                } label: {
                    Text("Save")
                }

            }
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My wish list", systemImage: "heart.circle", description: Text("No wishes"))
                }
            }
        }// :Nav
    }
}

#Preview("List with sample data") {
    let container = try! ModelContainer(for: WishlistModel.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    container.mainContext.insert(WishlistModel(title: "Buy new iphone"))
    container.mainContext.insert(WishlistModel(title: "Buy new macbook"))
    container.mainContext.insert(WishlistModel(title: "Buy new ipad"))
    container.mainContext.insert(WishlistModel(title: "Buy new airpods"))
    container.mainContext.insert(WishlistModel(title: "Buy new thing"))
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty list") {
    ContentView()
        .modelContainer(for: WishlistModel.self, inMemory: true)
}


