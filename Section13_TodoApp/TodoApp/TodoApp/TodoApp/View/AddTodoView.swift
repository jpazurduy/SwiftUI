//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/10/23.
//

import SwiftUI
enum Priority: String, CaseIterable, Identifiable {
    case high = "High"
    case normal = "Normal"
    case low = "Low"
    
    var id: Self { self}
}

struct AddTodoView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var name: String = ""
    @State private var priority: Priority = Priority.normal
    @State private var showingAddTodoView: Bool = false
    @State private var showingError: Bool = false
    @State private var errorTitle :String = ""
    @State private var errorMessage :String = ""
    
    // THEME
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - TODO NAME
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    // MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(Priority.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // MARK: - SAVE BUTOON
                    Button(action: {
                        if !self.name.isEmpty {
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority.rawValue
                            
                            PersistenceController.updateContext()
                        } else {
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something fo \nthe new todo item."
                            self.showingError = true
                            return
                        }
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0,maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                    })
                } // VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
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
            .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            
            }
        } // NavigationView
        .navigationViewStyle(StackNavigationViewStyle())
        .accentColor(themes[self.theme.themeSettings].themeColor)
        
    }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
