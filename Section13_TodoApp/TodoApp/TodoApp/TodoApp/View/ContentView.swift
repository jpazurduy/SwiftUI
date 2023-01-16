//
//  ContentView.swift
//  TodoApp
//
//  Created by Jorge Azurduy on 1/10/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>
    
    @State private var showAddTodoView: Bool = false
    
    @State private var showingSettingsView: Bool = false
    
    // THEME
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                // MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                        .padding(.top, 30)
                } else {
                    List {
                        ForEach(self.todos, id: \.self)  { todo in
                            HStack {
                                Circle()
                                    .frame(width: 12, height: 12, alignment: .center)
                                    .foregroundColor(self.colorize(priority: todo.priority ?? Priority.normal.rawValue))
                                Text(todo.name ?? " Unknown")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Text(todo.priority ?? "Unknown")
                                    .font(.body)
                                    .foregroundColor(Color(UIColor.systemGray2))
                                    .padding(3)
                                    .frame(minWidth: 72)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                    )
                            }
                            .padding(.horizontal, 20)
                        }
                        .onDelete(perform: deleteTodo)
                    } //LIST
                }
            } // ZSTACK
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
                leading:
                    EditButton()
                    .accentColor(themes[self.theme.themeSettings].themeColor),
                trailing:
                Button(action: {
                    self.showingSettingsView.toggle()
                }, label: {
                    Image(systemName: "paintbrush")
                        .foregroundColor(themes[self.theme.themeSettings].themeColor)
                })
            )
            .zIndex(1)
            .overlay(FloatingButtonView(showAddTodoView: $showAddTodoView), alignment: .bottomTrailing)
            .sheet(isPresented: $showingSettingsView) {
                SettingsView()
            }
            .sheet(isPresented: $showAddTodoView) {
                AddTodoView()
                    .environment(\.managedObjectContext, self.viewContext)
            }
            
        } // NAVIGATIOON
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    // MARK: - FUNCTIONS
    private func deleteTodo(at offsets :IndexSet) {
        for index in offsets {
            let todo = todos[index]
            viewContext.delete(todo)
            
            PersistenceController.updateContext()
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
            case Priority.high.rawValue:
                return .pink
            case Priority.normal.rawValue:
                return .green
            case Priority.low.rawValue:
                return .blue
            default:
                return .gray
        }
        
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
