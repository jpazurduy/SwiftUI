//
//  EditView.swift
//  Paws
//
//  Created by Jorge Azurduy on 2/3/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct EditPetView: View {
    @Bindable var pet: Pet
    
    @State var photoPickerItem: PhotosPickerItem?
    
    @Environment(\.dismiss) var dissmiss
    
    var body: some View {
        Form {
            
            if let imageData = pet.photo {
                if let image = UIImage(data: imageData) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 300)
                }
            } else {
                CustomContentUnavailableView(icon: "pawprint.circle", title: "No photo", description: "Add photo of your favorite pet to meke it easier to find me.")
                    .padding(.top)
            }
            
            // MARK: - Photo picker
            PhotosPicker(selection: $photoPickerItem, matching: .images) {
                Label("Select the photo", systemImage: "photo.badge.plus")
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - TextField
            TextField("Name", text: $pet.name)
                .textFieldStyle(.roundedBorder)
                .font(.largeTitle.weight(.light))
                .padding(.vertical)
            
            // MARK: - Button
            Button {
                dissmiss()
            } label: {
                Text("Save")
                    .font(.title3.weight(.medium))
                    .padding(8)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    
            }
            .buttonStyle(.borderedProminent)
            .listRowSeparator(.hidden)
            .padding(.bottom)

            
        }
        .listStyle(.plain)
        .navigationTitle("Edit \(pet.name)")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: photoPickerItem) {
            Task {
                
                pet.photo = try? await  photoPickerItem?.loadTransferable(type: Data.self)
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Pet.self, configurations: configuration)
    
    let sampleData = Pet(name: "Daisy")
    
    NavigationStack {
        EditPetView(pet: sampleData)
            .modelContainer(container)
    }
}
