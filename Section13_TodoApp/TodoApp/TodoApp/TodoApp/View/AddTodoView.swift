//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/10/23.
//

import SwiftUI
enum Priority: String, CaseIterable {
    case high = "High"
    case normal = "Normal"
    case low = "Low"
}


struct AddTodoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = Priority.normal.rawValue
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                    
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    // MARK: - SAVE BUTOON
                    Button(action: {
                        print("Save data")
                    }, label: {
                        Text("Saves")
                    })
                } // FORM
                Spacer()
            } // VSTACK
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(trailing:
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
            })
            )
        } // NavigationView
        
    }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
