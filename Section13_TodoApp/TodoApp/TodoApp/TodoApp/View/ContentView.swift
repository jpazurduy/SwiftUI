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
    @State private var animatingButton: Bool = false
    // MARK: - BODY
    var body: some View {
        
        NavigationView {
            ZStack {
                List {
                    ForEach(self.todos, id: \.self)  { todo in
                        HStack {
                            Text(todo.name ?? " Unknown")
                                .font(.body)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.body)
                        }
                        .padding(.horizontal, 20)
                    }
                    .onDelete(perform: deleteTodo)
                } //LIST
                
                // MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmptyListView()
                        .padding(.top, 30)
                }
            } // ZSTACK
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showAddTodoView.toggle()
                }, label: {
                    Image(systemName: "plus")
                })
            )
            .sheet(isPresented: $showAddTodoView) {
                AddTodoView()
                    .environment(\.managedObjectContext, self.viewContext)
            }
            .sheet(isPresented: $showAddTodoView) {
                AddTodoView()
                    .environment(\.managedObjectContext, self.viewContext)
            }
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(Color(.blue))
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(Color.blue)
                            .opacity(self.animatingButton ?  0.15 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }

                    Button(action: {
                        self.showAddTodoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(
                                Circle()
                                    .fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    })
                    
                } //  ZSTACK
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing)
            .onAppear() {
                withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: true)) {
                    self.animatingButton.toggle()
                }
            }
        } // NAVIGATIOON
    }
    
    
    // MARK: - FUNCTIONS
    private func deleteTodo(at offsets :IndexSet) {
        for index in offsets {
            let todo = todos[index]
            viewContext.delete(todo)
            
            PersistenceController.updateContext()
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
