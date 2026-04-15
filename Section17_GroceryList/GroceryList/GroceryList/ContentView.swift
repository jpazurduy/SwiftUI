//
//  ContentView.swift
//  GroceryList
//
//  Created by Jorge Azurduy on 1/26/26.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var item: String = ""
    @FocusState private var isFocused
    
    let buttonTip = ButtonTip()
    
    init() {
        try? Tips.configure()
    }
    
    func setupTips() {
        do {
            try Tips.resetDatastore()
            try Tips.configure([.displayFrequency(.immediate)])
            
        } catch {
            print("Error ", error.localizedDescription)
        }
    }
    
    func addEssentialFood() {
        modelContext.insert(Item(title: "RV", isCompleted: true))
        modelContext.insert(Item(title: "Cereals", isCompleted: false))
        modelContext.insert(Item(title: "Wheel", isCompleted: .random()))
        modelContext.insert(Item(title: "Fortnite", isCompleted: .random()))
        modelContext.insert(Item(title: "Cream", isCompleted: .random()))
        modelContext.insert(Item(title: "Cheese", isCompleted: true))
        
                            
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .fontWeight(.light)
                        .padding(.vertical, 2)
                        .foregroundStyle(item.isCompleted ? Color.primary : Color.accentColor)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                                
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted == false ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted == false ? .green : .accentColor)
                        }
                }
            }
            .navigationTitle("Grocery Store")
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Grocery",
                                           systemImage: "cart.circle",
                                           description: Text("Add an item to the list"))
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack(spacing: 12) {
                    TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    
                    Button {
                        guard !item.isEmpty else { return }
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                    
                }
                .padding()
                .background(.bar)
                
                
            }
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssentialFood()
                        } label: {
                            //Label("Essentials", systemImage: "carrot")
                            Image(systemName: "carrot")
                        }
                        .popoverTip(buttonTip)

                    }
                }
            }
        }
        
    }
}

#Preview("Sample Data ") {
    let sample: [Item] = [
        Item(title: "RV", isCompleted: true),
        Item(title: "Cereals", isCompleted: false),
        Item(title: "Wheel", isCompleted: .random()),
        Item(title: "Fortnite", isCompleted: .random()),
        Item(title: "Cream", isCompleted: .random()),
        Item(title: "Cheese", isCompleted: true)
    ]
    
    let container = try! ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    for item in sample {
        container.mainContext.insert(item)
    }
    
    return ContentView()
        .modelContainer(container)
}

#Preview("Empty List") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
