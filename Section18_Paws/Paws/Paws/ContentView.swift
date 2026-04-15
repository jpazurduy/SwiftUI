//
//  ContentView.swift
//  Paws
//
//  Created by Jorge Azurduy on 2/2/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query private var pets: [Pet]
    
    @State private var path = [Pet]()
    
    @State private var isEditing: Bool = false
    
    let layout = [
        GridItem(.flexible(minimum: 120)),
        GridItem(.flexible(minimum: 120))
    ]
    
    func addPet() {
        let pet = Pet(name: "Prissco")
        modelContext.insert(pet)
        path = [pet]
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: layout) {
                    GridRow {
                        ForEach(pets, id: \.id) { pet in
                            NavigationLink(value: pet) {
                                PetCell(pet: pet, isEditing: isEditing)
                            } // :Nav
                            .foregroundStyle(.primary)
                        } // :Loop
                    } // :GridRow
                } // :  GridLayout
                .padding(.horizontal, 0)
            } // : Scroll
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self) { pet in
                EditPetView(pet: pet)
            }
            .toolbar(content: {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add a new Pet", systemImage: "plus.circle", action: addPet)
                }
                
            })
            .edgesIgnoringSafeArea(.horizontal)
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavailableView(icon: "dog.circle",
                                                 title: "No pets",
                                                 description: "Add a new pet to get started")
                }
            }
            
        }
        .padding()
    }
}

private struct PetCell: View {
    let pet: Pet
    let isEditing: Bool
    
    var body: some View {
        VStack {
            petImage
                .resizable()
                .scaledToFit()
                .padding(20)
                .foregroundStyle(.quaternary)
            
            Spacer()
            
            Text(pet.name)
                .font(.title.weight(.light))
                .padding(.vertical)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
        .overlay(alignment: .topTrailing) {
            if isEditing {
                Menu {
                    // Actions can be added here later
                } label: {
                    Image(systemName: "trash.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .foregroundStyle(.red)
                        .symbolRenderingMode(.multicolor)
                        .padding()
                }
            }
        }
    }
    
    private var petImage: Image {
        if let data = pet.photo, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "pawprint.circle")
        }
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Pet.preview)
}

#Preview {
    ContentView()
        
}
